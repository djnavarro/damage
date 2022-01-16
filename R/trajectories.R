
select_trajectory <- function(seed, spiral, size) {

  set.seed(seed)

  iterations <- round(runif(1, min = 10^6, max = 10^7))

  dat <- damage_path(iter = iterations)
  colnames(dat) <- c("x0", "y0", "x1", "y1", "shade")

  dat %>%
    as.data.frame() %>%
    dplyr::mutate(
      y0 = spiral(y0),
      y1 = spiral(y1),
      sz = size(1:dplyr::n())
    ) %>%
    dplyr::filter(sz > 0) %>%
    dplyr::slice_sample(n = 10000)
}

