#ifndef FOURRIER_FREQS_H
#define FOURRIER_FREQS_H

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

typedef struct Freqs Freqs;

Freqs* allocFrequencies(const unsigned short int);
void freeFrequencies(Freqs*);
short int allocFourierBasis(struct Freqs*, const unsigned int);
double* addBasisElement(struct Freqs*, const double);
unsigned short int getHarmonics(const struct Freqs*);
double getFrequency(const Freqs*, const unsigned short int);
void setFrequency(Freqs*, const double, const unsigned short int);
double getAmplitude(const Freqs*, const unsigned short int);
void setAmplitude(Freqs*, const double, const unsigned short int);
double getPhase(const Freqs*, const unsigned short int);
void setPhase(Freqs*, const double, const unsigned short int);

#endif /* FOURRIER_FREQS_H */
