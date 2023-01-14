#ifndef _CLIB_H_
#define _CLIB_H_

typedef void (*CCallback)(void * context,
                          const char *,
                          const char *,
                          const char *,
                          const char *,
                          const char *,
                          const char *,
                          const char *);

typedef void (*CBlockCallback)(void * context,
                               const char * reserved0,
                               const char * reserved1,
                               const char * reserved2,
                               const char * reserved3,
                               const char * reserved4,
                               const char * reserved5,
                               const char * reserved6,
                               CCallback callback);

extern void simpleCallback0_0(void * context,
                              const char * reserved0,
                              const char * reserved1,
                              const char * reserved2,
                              const char * reserved3,
                              const char * reserved4,
                              const char * reserved5,
                              const char * reserved6,
                              CCallback callback);



#endif
