select_size <- function(seed) {
  sizes <- list(
    size_original,
    size_sparse,
    size_smooth
  )
  size <- sample(sizes, 1)[[1]]
  return(size)
}

size_original <- function(sz) {
  sample(
    x = c(0, .1, .5, 2),
    prob = c(.5, .47, .02, .01),
    size = length(sz),
    replace = TRUE
  )
}

size_sparse <- function(sz) {
  sample(
    x = c(0, 0, .5, 2),
    prob = c(.5, .47, .02, .01),
    size = length(sz),
    replace = TRUE
  )
}


size_smooth <- function(sz) {
  sz <- rnorm(length(sz), 0, .1)
  sz <- cumsum(sz)
  sz <- sz - min(sz)
  sz <- sz / max(sz)
  return(sz)
}


