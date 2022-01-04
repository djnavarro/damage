
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
    dplyr::mutate(sz = 1:dplyr::n())
}

