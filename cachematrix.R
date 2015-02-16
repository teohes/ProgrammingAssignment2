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
## NOTE:  makeCacheMatrix will not detect non-invertible matrices (ie.  no checking is done)

makeCacheMatrix <- function(x = matrix()) {
        mInv <- NULL                                # mInv= matrix inverse
        set <- function(y) {
                x <<- y                             # NOTE:  the <<- looks outside the current scope
				mInv <<- NULL                       # starting with the parents environment...
  		}											# (like global/common space ?)                       
        get <- function() x
        setInv <- function(solve) mInv <<- solve
        getInv <- function() mInv
        list(set = set, get = get, setInv = setInv,   # format:  set1=set2 where set1=list element name
             getInv = getInv)                         # and set2=function set2().  Same goes for get=get etc..
}                                                     # this is how cacheSolve can get to these functions in 
                                                      # makeCacheMatrix

## cacheSolve: Given a matrix "x" that was created using "makeCacheMatrix" above, cacheSolve will
## resort to using the previously computed (cached) value of the inverse of x.  If the 
## inverse of x does not exist, it will compute it using solve() the first time and cache
## the results for future use.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	    mInv <- x$getInv()                       # mInv gets loaded with NULL initally by makeCacheMatrix 
        if(!is.null(mInv)) {                     # so if not NULL, just return the cached mInv
                message("getting cached data")
                return(mInv)
        }
        data <- x$get()                          # otherwise get the original matrix 
        mInv <- solve(data, ...)                 # compute the inverse and 
        x$setInv(mInv)                           # cache it
        mInv                                     # don't forget to return the computed inverse
}
