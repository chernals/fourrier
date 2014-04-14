#ifndef FOURRIER_INTERPOLATIONS_H
#define FOURRIER_INTERPOLATIONS_H

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

short int frequencies(double *, const unsigned int, Freqs *, const _Bool, const _Bool);
short int frequenciesHanning(double *, const unsigned int, Freqs *, const _Bool);
short int frequenciesRect(double *, const unsigned int, Freqs *, const _Bool);

#endif /* FOURRIER_INTERPOLATIONS_H */
