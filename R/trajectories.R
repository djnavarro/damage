
select_trajectory <- function(seed) {

  set.seed(seed)

  iterations <- sample(
    x = c(10^4, 10^5, 10^6),
    size = 1,
    prob = c(.2, .2, .6)
  )

  dat <- damage_path(iter = iterations)
  colnames(dat) <- c("x0", "y0", "x1", "y1", "shade")

  dat %>%
    as.data.frame() %>%
    dplyr::mutate(
      sz = set_sizes(dplyr::n())
    )
}


set_sizes <- function(n) {
  sample(
    x = c(0, .1, .5, 2),
    prob = c(.5, .47, .02, .01),
    size = n,
    replace = TRUE
  )
}
