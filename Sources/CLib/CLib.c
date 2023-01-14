#include <stdio.h>
#include <stdlib.h>

#include "CLib.h"

void simpleCallback0_0(void * context,
                       const char * reserved0,
                       const char * reserved1,
                       const char * reserved2,
                       const char * reserved3,
                       const char * reserved4,
                       const char * reserved5,
                       const char * reserved6,
                       CCallback callback) {
    callback(context, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
}
