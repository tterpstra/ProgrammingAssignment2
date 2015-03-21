## This creates functions to write a matrix and its inverse to a cache
## and then read the matrix and inverse from the cache. It also provides
## functionality to subsequently use the matrix and inverse from the cache

## Create functions to Write matrix and inverse inverse into cache and read from cache
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    setmatrix <- function(y = NULL){
        m <<- y
    }
    setinverse <- function(y = NULL) {
        mi <<- solve(y)
    }
    getmatrix <- function() m
    getinverse <- function() mi
    list(setmatrix = setmatrix, setinverse = setinverse, getmatrix = getmatrix, getinverse = getinverse)
     
}


## Read inverse from cache if it exists, otherwise calc inverse
cacheSolve <- function(x, m, ...) {
        oldm <- x$getmatrix()
## Need to see if matrix has been cached, and is same matrix passed to this function        
        if (!is.null(oldm) && identical(m, oldm)) {
            return(x$getinverse())
        } else return(solve(m))
}
