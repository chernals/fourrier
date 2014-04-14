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

#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <complex.h>

struct Freqs{
   double *frequencies;
   double *amplitudes;
   double *phases;
   double _Complex **basis;
   unsigned short int harmonics;
   unsigned int length;
   unsigned int basis_elements;
   _Bool allocated_basis;
};

struct Freqs* allocFrequencies(const unsigned short int h)
{
   struct Freqs* f = (struct Freqs*) malloc(sizeof(struct Freqs));
   f->harmonics = h;
   f->frequencies = (double*) malloc(h*sizeof(double));
   f->amplitudes = (double*) malloc(h*sizeof(double));
   f->phases = (double*) malloc(h*sizeof(double));
   return f;
}

short int allocFourierBasis(struct Freqs* f, const unsigned int length)
{
  if(!f->allocated_basis)
  {
    f->length = length;
    f->basis_elements = 0;
    f->basis = (double _Complex **) malloc(f->harmonics*sizeof(double*));
    int i = 0;
    while(i < f->harmonics)
    {
      f->basis[i] = (double _Complex*) malloc(length*sizeof(double));
    }
    f->allocated_basis = true;
  }
  return 1;
}

double _Complex*
addBasisElement(struct Freqs* f, const double freq)
{
  for(unsigned int i = 0; i < f->length; i++)
  {
    f->basis[f->basis_elements][i] = cexp(-I*i*freq*2*M_PI);
  }
  f->basis_elements++;
  return f->basis[f->basis_elements-1];
}

void freeFrequencies(struct Freqs* f)
{
   /* TO DO */
}

unsigned short int getHarmonics(const struct Freqs* f)
{
  return f->harmonics;
}

double getFrequency(const struct Freqs* f, const unsigned short int n)
{
   return f->frequencies[n];
}

void setFrequency(struct Freqs* f, const double freq, const unsigned short int n)
{
  f->frequencies[n] = freq;
}

double getAmplitude(const struct Freqs* f, const unsigned short int n)
{
   return f->amplitudes[n];
}

void setAmplitude(struct Freqs* f, const double amp, const unsigned short int n)
{
  f->amplitudes[n] = amp;
}

double getPhase(const struct Freqs* f, const unsigned short int n)
{
   return f->phases[n];
}

void setPhase(const struct Freqs* f, const double phase, const unsigned short int n)
{
  f->phases[n] = phase;
}

double _Complex* getVector(const struct Freqs* f, const unsigned short int n)
{
  return f->basis[n];
}