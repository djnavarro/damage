
select_orientation <- function(seed) {
  set.seed(seed)
  orientation <- runif(1, min = 0, max = 2*pi)
  force(orientation)
  return(orientation)
}

select_breaks <- function(seed) {
  set.seed(seed)
  n <- sample(c(4, 8, 16), 1)
  force(n)
  function(x) {
    seq(
      from = x[1],
      to = x[2],
      length.out = n
    )
  }
}

cut_shades <- function(x, n) {
  x %>%
    ggplot2::cut_number(n = n) %>%
    as.numeric()
}

radial_limits <- function(y) {
  c(-.1 + min(y), .9 * max(y))
}

exact_limits <- function(x) {
  c(min(x), max(x))
}

