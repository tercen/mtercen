library(mtercen)
 
nrows = 3
ncols = 4

data = data.frame(.ci=as.integer(c(0,1,1,3)),
                  .ri=as.integer(c(0,1,1,2)),
                  .y=c(0.42,1.42,2.42,3.42))
  
rbenchmark::benchmark("mtercen::acast" = {
  matrix(mtercen::acast(data$.ri,
               data$.ci, 
               data$.y,
               nrows,
               ncols, 0.042),
         nrow = nrows,
         ncol=ncols)
},
"reshape2::acast" = {
  reshape2::acast(data, .ri ~ .ci, value.var='.y', fun.aggregate=mean, fill=0.042)
},
replications = 1000,
columns = c("test", "replications", "elapsed",
            "relative", "user.self", "sys.self"))

 
matrix(mtercen::acast(data$.ri,
                      data$.ci, 
                      data$.y,
                      nrows,
                      ncols, 0.042), 
       nrow = nrows,
       ncol=ncols)

matrix(mtercen::acast(data$.ri,
data$.ci,
data$.y,
nrows,
ncols, NaN),
nrow = nrows,
ncol=ncols)


reshape2::acast(data, .ri ~ .ci, value.var='.y', fun.aggregate=mean, fill=0.042)
