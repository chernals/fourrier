/**
* Fourrier
* A C library for tune computation
*
* Example01
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
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fourrier/fourrier.h>

int
main(int argc, char** argv)
{
  enum {buffer=256};
  
  opterr = 0;  
  int opt;
  char filename[buffer];
  unsigned short int harmonics = 1;
  unsigned int length = 1;
  while((opt = getopt(argc, argv, "h:f:n:")) != -1)
  {
	  if(opterr == 1) {}

    switch(opt)
    {
      case '?':
        printf("Unknown option.\n");
        return EXIT_FAILURE;
     		break;  
      case ':':
    		break;
      case 'n':
        length = atoi(optarg);
        break;
      case 'f':
        strcpy(filename, optarg);
        break;
      case 'h':
        harmonics = atoi(optarg);
        break;
      default:
        break;
    }       
  }
  // Read the example signal
  FILE *file;
  if(!(file = fopen(filename, "r")))
    return EXIT_FAILURE;
  
  printf("File name: %s\nSignal length: %d\nHarmonics: %d\n", filename, length, harmonics);
  double sig[length];
  int i=-1;
  double value;
  while(fscanf(file, "%lf", &value) > 0 && ++i < length)
    sig[i] = value;
  fclose(file);
  printf("Input signal correctly read.\n");
  
  // Allocate our `Freqs` object
  Freqs* freqs = allocFrequencies(harmonics);  
  
  // Processing
  frequenciesHanning(sig, length, freqs, true);

  return EXIT_SUCCESS;
}


/*

  for(unsigned int i = 0; i < length; i++)
  {
       printf("%f + i %f\n", creal(sig[i]), cimag(sig[i]));
  }
  
*/