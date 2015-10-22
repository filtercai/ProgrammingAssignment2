### Usage example


<!-- -->
> mt <- cbind(c(1, 2), c(3, 4))
> mt
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> 
> source("cachematrix.R")
> 
> tt <- makeCacheMatrix(mt)
> 
> cacheSolve(tt)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> 
> 
> 
> cacheSolve(tt)
getting from cached data
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
>
