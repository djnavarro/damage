

select_spiral <- function(seed) {
  spirals <- list(
    spiral_smooth,
    spiral_lumpy,
    spiral_none
  )
  spiral <- sample(spirals, 1)[[1]]
  return(spiral)
}

spiral_none <- function(x) {
  x
}

spiral_lumpy <- function(x) {
  n <- length(x)
  increment <- sort(runif(n))
  x + sqrt(increment)
}

spiral_smooth <- function(x) {
  n <- length(x)
  increment <- seq(0, 1, length.out = n)
  x + sqrt(increment)
}
