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

#define EXPORTING_libSchroederAlgorithm 1
#include "libSchroederAlgorithm.h"

static HMCRINSTANCE _mcr_inst = NULL;

#ifdef __cplusplus
extern "C" {
#endif

static int mclDefaultPrintHandler(const char *s)
{
    return mclWrite(1 /* stdout */, s, sizeof(char)*strlen(s));
}

#ifdef __cplusplus
} /* End extern "C" block */
#endif

#ifdef __cplusplus
extern "C" {
#endif

static int mclDefaultErrorHandler(const char *s)
{
    int written = 0;
    size_t len = 0;
    len = strlen(s);
    written = mclWrite(2 /* stderr */, s, sizeof(char)*len);
    if (len > 0 && s[ len-1 ] != '\n')
        written += mclWrite(2 /* stderr */, "\n", sizeof(char));
    return written;
}

#ifdef __cplusplus
} /* End extern "C" block */
#endif

/* This symbol is defined in shared libraries. Define it here
 * (to nothing) in case this isn't a shared library. 
 */
#ifndef LIB_libSchroederAlgorithm_C_API
#define LIB_libSchroederAlgorithm_C_API /* No special import/export declaration */
#endif

LIB_libSchroederAlgorithm_C_API 
bool MW_CALL_CONV libSchroederAlgorithmInitializeWithHandlers(
    mclOutputHandlerFcn error_handler,
    mclOutputHandlerFcn print_handler)
{
    int bResult = 0;
    if (_mcr_inst != NULL)
        return true;
    if (!mclmcrInitialize())
        return false;
    {
        mclCtfStream ctfStream = 
            mclGetEmbeddedCtfStream((void 
                                                     *)(libSchroederAlgorithmInitializeWithHandlers));
        if (ctfStream) {
            bResult = mclInitializeComponentInstanceEmbedded(&_mcr_inst,
                                                             error_handler, 
                                                             print_handler,
                                                             ctfStream);
            mclDestroyStream(ctfStream);
        } else {
            bResult = 0;
        }
    }  
    if (!bResult)
    return false;
    return true;
}

LIB_libSchroederAlgorithm_C_API 
bool MW_CALL_CONV libSchroederAlgorithmInitialize(void)
{
    return libSchroederAlgorithmInitializeWithHandlers(mclDefaultErrorHandler, 
                                                     mclDefaultPrintHandler);
}

LIB_libSchroederAlgorithm_C_API 
void MW_CALL_CONV libSchroederAlgorithmTerminate(void)
{
    if (_mcr_inst != NULL)
        mclTerminateInstance(&_mcr_inst);
}

LIB_libSchroederAlgorithm_C_API 
void MW_CALL_CONV libSchroederAlgorithmPrintStackTrace(void) 
{
    char** stackTrace;
    int stackDepth = mclGetStackTrace(&stackTrace);
    int i;
    for(i=0; i<stackDepth; i++)
    {
        mclWrite(2 /* stderr */, stackTrace[i], sizeof(char)*strlen(stackTrace[i]));
        mclWrite(2 /* stderr */, "\n", sizeof(char)*strlen("\n"));
    }
    mclFreeStackTrace(&stackTrace, stackDepth);
}


LIB_libSchroederAlgorithm_C_API 
bool MW_CALL_CONV mlxSchroederAlgorithm(int nlhs, mxArray *plhs[], int nrhs, mxArray 
                                        *prhs[])
{
    return mclFeval(_mcr_inst, "SchroederAlgorithm", nlhs, plhs, nrhs, prhs);
}

LIB_libSchroederAlgorithm_C_API 
bool MW_CALL_CONV mlfSchroederAlgorithm(int nargout, mxArray** schroederAudio, mxArray* 
                                        fileLocation, mxArray* reverbAmount)
{
    return mclMlfFeval(_mcr_inst, "SchroederAlgorithm", nargout, 1, 2, schroederAudio, fileLocation, reverbAmount);
}

