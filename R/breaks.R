
select_breaks <- function(seed) {
  set.seed(seed)
  breaks <- list(
    even_breaks,
    uneven_breaks
  )
  sample(breaks)[[1]]()
}


even_breaks <- function() {
  function(x) {
    seq(
      from = x[1],
      to = x[2],
      length.out = sample(1:20, 1)
    )
  }
}

uneven_breaks <- function() {
  function(x) {
    sort(stats::runif(
      n = sample(1:20, 1),
      min = x[1],
      max = x[2]
    ), decreasing = FALSE)
  }
}



