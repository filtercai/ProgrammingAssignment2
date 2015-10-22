## A pair of functions that cache the inverse of a matrix.
## R programming Language Programming Assignment 2
## Chunhua Cai
## 2015-10-22

## usage example:
## > mt <- cbind(c(1,2),c(3,4))  # create the test matrix
## > source("cachematrix.R")     #
## > tt <- makeCacheMatrix(mt)   # create the specical objects
## > cacheSolve(tt)              # will display the result
## > cacheSolve(tt)              # will display a msg and the result
##

## Function to init and cache the result matrix
## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    # init the var for store and cache
    m <- NULL
    
    # set function
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    # get function to return value
    get <- function()
        x
    
    # function to cache the inverse result
    setMatrix <- function(inverse)
        m <<- inverse
    
    # function to get the inverse result from cache
    getMatrix <- function()
        m
    
    # function return list contain four functionsstoc
    list(
        set = set,
        get = get,
        setMatrix = setMatrix,
        getMatrix = getMatrix
    )
    
}


## function to inverse a matrix
## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then the cachesolve should retrieve the inverse 
## from the cache.
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getMatrix()
    # determine the cached status
    if (!is.null(m)) {
        message("getting from cached data")
        return(m)
    }
    
    # get the matrix and calculate the inverse
    data <- x$get()
    m <- solve(data, ...)
    
    x$setMatrix(m)
    
    m
}