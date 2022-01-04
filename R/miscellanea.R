
select_orientation <- function(seed) {
  set.seed(seed)
  orientation <- runif(1, min = 0, max = 2*pi)
  force(orientation)
  return(orientation)
}

select_breaks <- function(seed) {
  set.seed(seed)
  n <- sample(1:20, 1)
  force(n)
  function(x) {
    seq(
      from = x[1],
      to = x[2],
      length.out = n
    )
  }
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

