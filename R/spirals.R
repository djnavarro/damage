

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
  normalise(x)
}

spiral_lumpy <- function(x) {
  n <- length(x)
  increment <- sort(stats::runif(n))
  x <- x + sqrt(increment)
  normalise(x)
}

spiral_smooth <- function(x) {
  n <- length(x)
  increment <- seq(0, 1, length.out = n)
  x <- x + sqrt(increment)
  normalise(x)
}


normalise <- function (x, from = range(x), to = c(0, 1))
{
  x <- (x - from[1])/(from[2] - from[1])
  if (!identical(to, c(0, 1))) {
    x <- x * (to[2] - to[1]) + to[1]
  }
  x
}
