//
// MATLAB Compiler: 7.0.1 (R2019a)
// Date: Thu May  2 12:28:40 2019
// Arguments:
// "-B""macro_default""-W""cpplib:RiRLib""-T""link:lib""RirFunction.m"
//

#define EXPORTING_RiRLib 1
#include "RiRLib.h"

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
#ifndef LIB_RiRLib_C_API
#define LIB_RiRLib_C_API /* No special import/export declaration */
#endif

LIB_RiRLib_C_API 
bool MW_CALL_CONV RiRLibInitializeWithHandlers(
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
            mclGetEmbeddedCtfStream((void *)(RiRLibInitializeWithHandlers));
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

LIB_RiRLib_C_API 
bool MW_CALL_CONV RiRLibInitialize(void)
{
    return RiRLibInitializeWithHandlers(mclDefaultErrorHandler, mclDefaultPrintHandler);
}

LIB_RiRLib_C_API 
void MW_CALL_CONV RiRLibTerminate(void)
{
    if (_mcr_inst != NULL)
        mclTerminateInstance(&_mcr_inst);
}

LIB_RiRLib_C_API 
void MW_CALL_CONV RiRLibPrintStackTrace(void) 
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


LIB_RiRLib_C_API 
bool MW_CALL_CONV mlxRirFunction(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[])
{
    return mclFeval(_mcr_inst, "RirFunction", nlhs, plhs, nrhs, prhs);
}

LIB_RiRLib_CPP_API 
void MW_CALL_CONV RirFunction(int nargout, mwArray& RirAudio, const mwArray& 
                              fileLocation, const mwArray& soundVelocity, const mwArray& 
                              roomSize, const mwArray& reverbTime)
{
    mclcppMlfFeval(_mcr_inst, "RirFunction", nargout, 1, 4, &RirAudio, &fileLocation, &soundVelocity, &roomSize, &reverbTime);
}

