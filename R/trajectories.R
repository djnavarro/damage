
select_trajectory <- function(seed) {

  set.seed(seed)

  iterations <- round(runif(1, min = 10^5, max = 10^6))

  dat <- damage_path(iter = iterations)
  colnames(dat) <- c("x0", "y0", "x1", "y1", "shade")

  dat %>%
    as.data.frame() %>%
    dplyr::mutate(sz = 1:dplyr::n())
}

