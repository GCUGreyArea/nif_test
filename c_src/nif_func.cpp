#include "nif_func.h"

#include <stdio.h>
#include <string.h>
#include <erl_nif.h>
#include <time.h>

/**
 * @brief Simple function to return current system time as a time_t value
 * 
 * @param env 
 * @param argc 
 * @param argv 
 * @return ERL_NIF_TERM 
 */

static ERL_NIF_TERM 
nif_now(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[]) 
{
    return enif_make_int(env, time(0));
}

/**
 * @brief simple function to return the square of a int value passed in
 * 
 * @param env 
 * @param argc 
 * @param argv 
 * @return ERL_NIF_TERM 
 */
static ERL_NIF_TERM 
nif_square(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    int x, ret;
    if (!enif_get_int(env, argv[0], &x)) {
	return enif_make_badarg(env);
    }
    ret = x * x;
    return enif_make_int(env, ret);
}

/**
 * @brief Exported fucntions for Erlang module
 * 
 */
static ErlNifFunc nif_funcs[] = {
    {"now",    0, nif_now},
    {"square", 1, nif_square},
    // {"bar", 1, bar_nif}
};

/**
 * @brief Declare the export and the Erlang module they belong to
 * 
 */
ERL_NIF_INIT(nif_test,nif_funcs,NULL,NULL,NULL,NULL);