library(snow)

n.cores = 3 # max 16

cluster = makeSOCKcluster(rep("localhost", n.cores))

f = function(x) {
  
  set.seed(4)
  
  runif(1)
  
}



x = as.list(1:20)

clusterSetupRNG(cluster) # if this is run, the random numbers will
  # be different, even with the set.seed in the function
  # Without it, if there is no set.seed in the function, the numbers are
  # still different.

a = parLapply(cluster, x, f)
