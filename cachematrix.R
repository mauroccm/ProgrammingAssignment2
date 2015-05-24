## Put comments here that give an overall description of what your
## functions do

## A matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  function(y){
    x<<-y
    m<<-NULL
  }
  getMatrix <- function() {
      x
  }
  setInverse <- function(solve) {
      m <<- solve
  }
  getInverse <- function(){
      m
  }
  matrix()
}

## Computes de inverse matrix computed by the function makeCacheMatrix() -
## if it has not been computed before.

cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached matrix")
    return(m)
  }
  data <- x$getMatrix()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}
