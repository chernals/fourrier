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
#include <math.h>
#include <complex.h>

void Hanning_r(double *signal, const unsigned int length, double *w)
{
  for(unsigned int i = 0; i < length; i++)
  {
    // Two equivalent formulations
    //w[i] = signal[i] * 2.0 * sin(M_PI*(i+1)/length) * sin(M_PI*(i+1)/length);
    w[i] = signal[i] * (1.0 - cos(2.0*M_PI*(i+1)/length));
    //printf("From Hanning_r: %lf\n",w[i]);
  }
}

void Hanning_c(double _Complex *signal, const unsigned int length, double _Complex *w)
{
  for(unsigned int i=0; i<length; i++)
  {
    // Two equivalent formulations
    //w[i] = signal[i] * 2.0 * sin(M_PI*(i+1)/length) * sin(M_PI*(i+1)/length);
    w[i] = signal[i] * (1.0 - cos(2.0*M_PI*(i+1)/length));
  }
}
