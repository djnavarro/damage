
select_orientation <- function(seed) {
  set.seed(seed)
  orientation <- stats::runif(1, min = 0, max = 2*pi)
  force(orientation)
  return(orientation)
}

select_lineend <- function(seed) {
  set.seed(seed)
  sample(c("butt", "round", "square"), 1)
}

select_linetype <- function(seed) {

  set.seed(seed)
  len <- c(1:9, letters[1:6])
  str <- paste0(sample(len, 6, TRUE), collapse="")
  return(str)

}

cut_shades <- function(x, n) {
  x %>%
    ggplot2::cut_number(n = n) %>%
    as.numeric()
}

y_limits <- function(y) {
  c(-.1 + min(y), .9 * max(y))
}

x_limits <- function(x) {
  c(min(x), max(x))
}

utils::globalVariables(c("shade", "sz", "x0", "y0", "y1", "colores"))
