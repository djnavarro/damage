
select_orientation <- function(seed) {
  set.seed(seed)
  orientation <- runif(1, min = 0, max = 2*pi)
  return(orientation)
}

select_breaks <- function(seed) {
  set.seed(seed)
  n <- sample(c(4, 8, 16), 1)
  scales::pretty_breaks(n = n)
}

cut_shades <- function(x, n) {
  x %>%
    ggplot2::cut_number(n = n) %>%
    as.numeric()
}

radial_limits <- function(y) {
  c(-.1 + min(y), .9 * max(y))
}
