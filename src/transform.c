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

#include <complex.h>
#include <stdbool.h>
#include <freqs.h>

short int
fourierTransform(const double *signal, const unsigned int length, Freqs *freqs, const double freq)
{
  double _Complex* vector = addBasisElement(freqs, freq);
  double _Complex projection = 0;
  for(unsigned int i = 0; i < length; i++)
  {
    projection += vector[i] * signal[i];
  }
  
  
}


//substractInverseTransform(signal, freqs);