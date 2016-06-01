Builds from Rich FitzJohn, June 2016

See `hiredis_compile.sh` for details.

Currently compiles using the hiredis library in [this windows port of Redis](https://github.com/dmajkic/redis) based on instructions from [Rcpp-devel](http://lists.r-forge.r-project.org/pipermail/rcpp-devel/2014-May/007584.html) which should give the same hiredis library as CRAN/R win builder use.

The [Microsoft hiredis port](https://github.com/Microsoft/hiredis) would likely be a much better place to start though.

`RcppRedis` uses the `LIB_HIREDIS` variable to use the hiredis library on CRAN.  Set that to the root of this directory.
