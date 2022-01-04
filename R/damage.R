
#' Generate damage art
#'
#' @param seed
#' @param filename
#'
#' @return art
#' @export
damage <- function(seed, filename = NULL) {

  set.seed(seed)

  seeds <- sample(1:1000, 6)

  palette     <- select_palette(seeds[1])
  background  <- select_background(seeds[2])
  trajectory  <- select_trajectory(seeds[3])
  orientation <- select_orientation(seeds[4])
  spiral      <- select_spiral(seeds[5])
  breaks      <- select_breaks(seeds[6])

  pic <- construct_damage(palette, background, trajectory, orientation,
                          spiral, breaks)

  if(is.null(filename)) {
    filename <- paste0("~/Desktop/damage_", seed, ".png")
  }

  npix <- 3000
  ggplot2::ggsave(
    filename = filename,
    plot = pic,
    width = npix/300,
    height = npix/300,
    dpi = 300
  )
}

construct_damage <- function(palette, background, trajectory, orientation,
                             spiral, breaks) {
  set.seed(1)
  trajectory %>%
    ggplot2::ggplot(ggplot2::aes(
      x = x0,
      y = spiral(y0),
      xend = x0,
      yend = spiral(y1),
      colour = cut_shades(shade, length(palette)),
      size = sz
    )) +
    ggplot2::geom_path(show.legend = FALSE) +
    ggplot2::coord_polar(start = orientation, clip = "off") +
    background(palette) +
    ggplot2::scale_color_gradientn(colours = palette) +
    ggplot2::scale_size_identity() +
    ggplot2::scale_y_continuous(
      limits = radial_limits(trajectory$y0),
      expand = c(0, 0),
      breaks = breaks,
      oob = scales::oob_keep
    ) +
    ggplot2::scale_x_continuous(
      breaks = breaks
    )
}


