
#' Generate damage art
#'
#' @param seed integer seed specifying piece number
#' @param filename file to save the output to
#' @param pixels resolution
#'
#' @return art
#' @export
damage <- function(seed, filename, pixels = 3000) {

  set.seed(seed)

  seeds <- sample(1:1000, 9)

  palette     <- select_palette(seeds[1])
  background  <- select_background(seeds[2])
  trajectory  <- select_trajectory(seeds[3])
  orientation <- select_orientation(seeds[4])
  spiral      <- select_spiral(seeds[5])
  breaks      <- select_breaks(seeds[6])
  linetype    <- select_linetype(seeds[7])
  lineend     <- select_lineend(seeds[8])
  size        <- select_size(seeds[9])

  pic <- construct_damage(seed, palette, background, trajectory, orientation,
                          spiral, breaks, linetype, lineend, size)

  npix <- 3000
  ggplot2::ggsave(
    filename = filename,
    plot = pic,
    width = npix/300,
    height = npix/300,
    dpi = 300
  )
}

construct_damage <- function(seed, palette, background, trajectory, orientation,
                             spiral, breaks, linetype, lineend, size) {
  set.seed(1)
  trajectory %>%
    ggplot2::ggplot(ggplot2::aes(
      x = x0,
      y = spiral(y0),
      xend = x0,
      yend = spiral(y1),
      colour = cut_shades(shade, length(palette)),
      size = size(sz)
    )) +
    ggplot2::geom_path(
      show.legend = FALSE,
      lineend = lineend
    ) +
    ggplot2::coord_polar(start = orientation, clip = "off") +
    background(
      palette = palette,
      linetype = linetype
    ) +
    ggplot2::scale_color_gradientn(colours = palette) +
    ggplot2::scale_size_identity() +
    ggplot2::scale_y_continuous(
      limits = y_limits(spiral(trajectory$y0)), # <- ugly hack
      expand = c(0, 0),
      breaks = breaks,
      oob = scales::oob_keep
    ) +
    ggplot2::scale_x_continuous(
      expand = c(0, 0),
      limits = x_limits(trajectory$x0),
      breaks = breaks
    )
}


