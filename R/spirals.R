

select_spiral <- function(seed) {
  return(spiral_out)
}

spiral_out <- function(x) {
  x + sqrt(seq(0, 1, length.out = length(x)))
}
