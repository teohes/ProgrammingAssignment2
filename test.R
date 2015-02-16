## The original Test Code was outlined in Coursera R-programming forum :
## "Forums / Programming Assignment 2 (peer assessment): Lexical Scoping by Jules Stuifbergen" 
## Test your code
## source("cachematrix.R")

# generate matrix, and the inverse of the matrix.
size <- 4000 # size of the matrix edge, don't make this too big
print("Square Matrix size")
print(size)
print("------------------------------- ")

t1<-print(Sys.time())
print("mymatrix <- matrix(rnorm(size^2), nrow=size, ncol=size)")
mymatrix <- matrix(rnorm(size^2), nrow=size, ncol=size)
print(Sys.time()-t1)
print("------------------------------- ")

t1<-print(Sys.time())
print("mymatrix.inverse <- solve(mymatrix)")
mymatrix.inverse <- solve(mymatrix)
print(Sys.time()-t1)
print("------------------------------- ")

#
# now solve the matrix via the cache-method
#
# 
t1<-print(Sys.time())
print("special.matrix <- makeCacheMatrix(mymatrix)")
special.matrix <- makeCacheMatrix(mymatrix)
print(Sys.time()-t1)
print("------------------------------- ")
# #
# # this should take long, since it's the first go
t1<-print(Sys.time())
print("special.solved.1 <- cacheSolve(special.matrix)")
special.solved.1 <- cacheSolve(special.matrix)
print(Sys.time()-t1)
print("------------------------------- ")
# #
# # this should be lightning fast
t1<-print(Sys.time())
print("special.solved.2 <- cacheSolve(special.matrix)")
special.solved.2 <- cacheSolve(special.matrix)
print(Sys.time()-t1)
print("------------------------------- ")
# #
# # check if all solved matrices are identical
print("identical(mymatrix.inverse, special.solved.1) & identical(mymatrix.inverse, special.solved.2)")
print(identical(mymatrix.inverse, special.solved.1) & identical(mymatrix.inverse, special.solved.2))
# #
# # should return TRUE
# %}