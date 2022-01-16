select_size <- function(seed) {
  sizes <- list(
    size_original,
    size_sparse,
    size_chonk
  )
  size <- sample(sizes, 1)[[1]]
  return(size)
}

size_original <- function(sz) {
  sample(
    x = c(0, .1, .5, 2),
    prob = c(.97, .02, .01, .01),
    size = length(sz),
    replace = TRUE
  )
}

size_sparse <- function(sz) {
  sample(
    x = c(0, .5, 2),
    prob = c(.97, .02, .01),
    size = length(sz),
    replace = TRUE
  )
}


size_chonk <- function(sz) {
  sz <- sample(
    x = c(0, .1, 3),
    prob = c(.97, .02, .01),
    size = length(sz),
    replace = TRUE
  )
  return(sz)
}


