#ifndef FOURRIER_FILTERS_H
#define FOURRIER_FILTERS_H

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

#include <math.h>
#include <complex.h>

void Hanning_r(double*, const unsigned int, double*);
void Hanning_c(double _Complex*, const unsigned int, double _Complex*);

#endif /* FOURRIER_FILTERS_H */
