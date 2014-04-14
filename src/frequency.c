/**
* Fourrier
* A C library for tune computation
*
* Author: Cedric Hernaslteens <cedric.hernalsteens@cern.ch>
* 
* European Organization for Nuclear Research
*
* Copyright (c) 2014+ CERN. All rights reserved.
*
**/

#include <stdio.h>
#include <stdlib.h> 
#include <stdbool.h>
#include <string.h>
#include <math.h>
#include <complex.h>
#include <fftw3.h>
#include <filters.h>
#include <freqs.h>
#include <transform.h>

static unsigned int
findPeak(double _Complex *transform, const unsigned int length)
{
   int peak = 0;
   double max = transform[0];
   unsigned int i = -1;
   while(++i < length)
   {
      if(cabs(transform[i])>max)
      {
         peak = i;
         max = cabs(transform[i]);
      }
   }
   return peak;
}

static double
interpolateHanningSin(double _Complex *transform, unsigned int length, _Bool exact)
{
   double result = 0.0;
   const unsigned int peak = findPeak(transform, length);
   if(exact)
   {
      double a = cabs(transform[peak]);
      double b = cabs(transform[peak+1]);
      double c = cos(2.0*M_PI/length);
      double arg = (-(a+b*c)*(a-b)+b*sqrt(c*c*(a+b)*(a+b)-2.0*a*b*(2.0*c*c-c-1.0)))/(a*a+b*b+2.0*a*b*c);
      result = (peak/(double)length) + 0.5 * M_1_PI * asin(arg*sin(2.0*M_PI/length));
   }
   else
   {
      result = (peak/(double)length) + (1.0/length) * (3*cabs(transform[peak+1])/(cabs(transform[peak]) + cabs(transform[peak+1]))-1);
   }
   return result;
}

static double
interpolateRectSin(double _Complex *transform, unsigned int length, _Bool exact)
{
   double result = 0.0;
   const unsigned int peak = findPeak(transform, length);
      
   if(exact)
   {
      double arg = cabs(transform[peak+1]) * sin(M_PI/length);
      arg /= cabs(transform[peak]) + cabs(transform[peak+1]) * cos(M_PI/length);
      result = (peak/(double)length) + M_1_PI * atan(arg);
   }
   else
   {
      result = (peak/(double)length) + (1.0/length) * (cabs(transform[peak+1])/(cabs(transform[peak]) + cabs(transform[peak+1])));
   }
   return result;
}

short int
frequencies(double *signal, 
            const unsigned int length, 
            struct Freqs *freqs,
            const _Bool hanning,
            const _Bool exact) 
{   
   // Prepare FFTW plans for our signal
   double *windowed = NULL;
   windowed = (double*) malloc(length*sizeof(double));
   memcpy(windowed, signal, length*sizeof(double));
   double _Complex *transform = (double _Complex*) malloc(length*sizeof(double _Complex));
   fftw_plan p = fftw_plan_dft_r2c_1d(length, windowed, (fftw_complex*)transform, FFTW_ESTIMATE);
   if(!p) return -1;
   
   // Iterate over each harmonics of the windowed signal
   double freq;
   unsigned short int remaining = getHarmonics(freqs);
   allocFourierBasis(freqs, length);
   do
   {
      if(hanning) // Hanning window
      {
         Hanning_r(signal, length, windowed);
      }
      
      // Find the fundamental frequency
      fftw_execute(p);
      if(hanning)
         freq = interpolateHanningSin(transform, length, exact);
      else
         freq = interpolateRectSin(transform, length, exact);
      setFrequency(freqs, freq, getHarmonics(freqs)-remaining);
      
      // Project and substract the line from the windowed signal
    //  fourierTransform(signal, freqs, freq);
     // substractInverseTransform(signal, freqs);
   
   }
   while(--remaining > 0);
   
   // Cleaning up FFTW plan
   fftw_destroy_plan(p);
   free(transform);
   
   return 0;
}

short int 
frequenciesHanning(double *signal, 
                   const unsigned int length, 
                   Freqs *freqs,
                   const _Bool exact) 
{
   
   return frequencies(signal, length, freqs, true, exact);
}

short int
frequenciesRect(double *signal, 
                const unsigned int length, 
                Freqs *freqs,
                const _Bool exact) 
{
   return frequencies(signal, length, freqs, false, exact);
}
