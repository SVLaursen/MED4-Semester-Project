//
// MATLAB Compiler: 7.0.1 (R2019a)
// Date: Thu May  2 12:37:32 2019
// Arguments:
// "-B""macro_default""-W""cpplib:SchroederLib""-T""link:lib""SchroederAlgorithm
// .m"
//

#ifndef __SchroederLib_h
#define __SchroederLib_h 1

#if defined(__cplusplus) && !defined(mclmcrrt_h) && defined(__linux__)
#  pragma implementation "mclmcrrt.h"
#endif
#include "mclmcrrt.h"
#include "mclcppclass.h"
#ifdef __cplusplus
extern "C" {
#endif

/* This symbol is defined in shared libraries. Define it here
 * (to nothing) in case this isn't a shared library. 
 */
#ifndef LIB_SchroederLib_C_API 
#define LIB_SchroederLib_C_API /* No special import/export declaration */
#endif

/* GENERAL LIBRARY FUNCTIONS -- START */

extern LIB_SchroederLib_C_API 
bool MW_CALL_CONV SchroederLibInitializeWithHandlers(
       mclOutputHandlerFcn error_handler, 
       mclOutputHandlerFcn print_handler);

extern LIB_SchroederLib_C_API 
bool MW_CALL_CONV SchroederLibInitialize(void);

extern LIB_SchroederLib_C_API 
void MW_CALL_CONV SchroederLibTerminate(void);

extern LIB_SchroederLib_C_API 
void MW_CALL_CONV SchroederLibPrintStackTrace(void);

/* GENERAL LIBRARY FUNCTIONS -- END */

/* C INTERFACE -- MLX WRAPPERS FOR USER-DEFINED MATLAB FUNCTIONS -- START */

extern LIB_SchroederLib_C_API 
bool MW_CALL_CONV mlxSchroederAlgorithm(int nlhs, mxArray *plhs[], int nrhs, mxArray 
                                        *prhs[]);

/* C INTERFACE -- MLX WRAPPERS FOR USER-DEFINED MATLAB FUNCTIONS -- END */

#ifdef __cplusplus
}
#endif


/* C++ INTERFACE -- WRAPPERS FOR USER-DEFINED MATLAB FUNCTIONS -- START */

#ifdef __cplusplus

/* On Windows, use __declspec to control the exported API */
#if defined(_MSC_VER) || defined(__MINGW64__)

#ifdef EXPORTING_SchroederLib
#define PUBLIC_SchroederLib_CPP_API __declspec(dllexport)
#else
#define PUBLIC_SchroederLib_CPP_API __declspec(dllimport)
#endif

#define LIB_SchroederLib_CPP_API PUBLIC_SchroederLib_CPP_API

#else

#if !defined(LIB_SchroederLib_CPP_API)
#if defined(LIB_SchroederLib_C_API)
#define LIB_SchroederLib_CPP_API LIB_SchroederLib_C_API
#else
#define LIB_SchroederLib_CPP_API /* empty! */ 
#endif
#endif

#endif

extern LIB_SchroederLib_CPP_API void MW_CALL_CONV SchroederAlgorithm(int nargout, mwArray& schroederAudio, const mwArray& fileLocation, const mwArray& reverbAmount);

/* C++ INTERFACE -- WRAPPERS FOR USER-DEFINED MATLAB FUNCTIONS -- END */
#endif

#endif
