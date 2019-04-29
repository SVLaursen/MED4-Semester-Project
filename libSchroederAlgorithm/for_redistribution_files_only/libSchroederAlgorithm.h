/*
 * MATLAB Compiler: 7.0.1 (R2019a)
 * Date: Mon Apr 29 13:10:20 2019
 * Arguments:
 * "-B""macro_default""-W""lib:libSchroederAlgorithm""-T""link:lib""-d""/Users/s
 * imonlaursen/Dropbox/AAU/4Semester/Semester
 * Project/MED4-Semester-Project/libSchroederAlgorithm/for_testing""-v""/Users/s
 * imonlaursen/Dropbox/AAU/4Semester/Semester
 * Project/MED4-Semester-Project/projectAnia/SchroederAlgorithm.m"
 */

#ifndef __libSchroederAlgorithm_h
#define __libSchroederAlgorithm_h 1

#if defined(__cplusplus) && !defined(mclmcrrt_h) && defined(__linux__)
#  pragma implementation "mclmcrrt.h"
#endif
#include "mclmcrrt.h"
#ifdef __cplusplus
extern "C" {
#endif

/* This symbol is defined in shared libraries. Define it here
 * (to nothing) in case this isn't a shared library. 
 */
#ifndef LIB_libSchroederAlgorithm_C_API 
#define LIB_libSchroederAlgorithm_C_API /* No special import/export declaration */
#endif

/* GENERAL LIBRARY FUNCTIONS -- START */

extern LIB_libSchroederAlgorithm_C_API 
bool MW_CALL_CONV libSchroederAlgorithmInitializeWithHandlers(
       mclOutputHandlerFcn error_handler, 
       mclOutputHandlerFcn print_handler);

extern LIB_libSchroederAlgorithm_C_API 
bool MW_CALL_CONV libSchroederAlgorithmInitialize(void);

extern LIB_libSchroederAlgorithm_C_API 
void MW_CALL_CONV libSchroederAlgorithmTerminate(void);

extern LIB_libSchroederAlgorithm_C_API 
void MW_CALL_CONV libSchroederAlgorithmPrintStackTrace(void);

/* GENERAL LIBRARY FUNCTIONS -- END */

/* C INTERFACE -- MLX WRAPPERS FOR USER-DEFINED MATLAB FUNCTIONS -- START */

extern LIB_libSchroederAlgorithm_C_API 
bool MW_CALL_CONV mlxSchroederAlgorithm(int nlhs, mxArray *plhs[], int nrhs, mxArray 
                                        *prhs[]);

/* C INTERFACE -- MLX WRAPPERS FOR USER-DEFINED MATLAB FUNCTIONS -- END */

/* C INTERFACE -- MLF WRAPPERS FOR USER-DEFINED MATLAB FUNCTIONS -- START */

extern LIB_libSchroederAlgorithm_C_API bool MW_CALL_CONV mlfSchroederAlgorithm(int nargout, mxArray** schroederAudio, mxArray* fileLocation, mxArray* reverbAmount);

#ifdef __cplusplus
}
#endif
/* C INTERFACE -- MLF WRAPPERS FOR USER-DEFINED MATLAB FUNCTIONS -- END */

#endif
