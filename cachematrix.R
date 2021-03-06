## Two functions are developped here. 
## * "makeCacheMatrix" creates a special object that can cache a "matrix" and its inverse,
## * "cacheSolve" compute the inverse of the matrix in the special "matrix" object.


## function makeCacheMatrix creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse<- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## function cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above.
#   If the inverse has already been calculated (and the matrix has not changed),
#   then the cachesolve should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setinverse(m)
    m
}
