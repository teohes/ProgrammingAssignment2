## The two functions below can be tested using the "test.R" script found in the same
## directory.  The original Test Code was outlined in Coursera R-programming forum :
## "Forums / Programming Assignment 2 (peer assessment): Lexical Scoping by Jules Stuifbergen"
## 
## File "OUTPUT-test.png" in the same directory is a screengrab of a typical run of "test.R".
## NOTE the time went from 2.25 min to compute the inverse to 0.001 sec to fetch from the cache !
## 
## makeCacheMatrix creates a special "matrix" which is a list containing functions to:
## 1.  set the value of the matrix
## 2.  get the value of the matrix
## 3.  calculate and set the Inverse of the matrix
## 4.  get the inverse of the matrix

## The critical/definitive operator to achieve this is by use of the "Super-assignment" 
## operator  " <<- ".
## NOTE:  makeCacheMatrix will only work on "invertible" matrices eg.  SQUARE matrix.

makeCacheMatrix <- function(x = matrix()) {
        mInv <- NULL
        set <- function(y) {
                x <<- y
                mInv <<- NULL
        }
        get <- function() x
        setInv <- function(solve) mInv <<- solve
        getInv <- function() mInv
        list(set = set, get = get, setInv = setInv,
             getInv = getInv)
}


## Given a matrix "x" that was created using "makeCacheMatrix" above, cacheSolve will
## resort to using the previously calculated (cached) value of the inverse of x.  If the 
## inverse of x does not exist, it will calculate it using solve() the first time and cache
## the results for future use.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	    mInv <- x$getInv()
        if(!is.null(mInv)) {
                message("getting cached data")
                return(mInv)
        }
        data <- x$get()
        mInv <- solve(data, ...)
        x$setInv(mInv)
        mInv
}
