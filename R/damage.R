
#' Generate damage art
#'
#' @param seed integer seed specifying piece number
#' @param filename file to save the output to
#' @param pixels resolution
#'
#' @return art
#' @export
damage <- function(seed, filename = NULL, pixels = 3000) {

  set.seed(seed)

  seeds <- sample(1:1000, 9)

  palette     <- select_palette(seeds[1])
  background  <- select_background(seeds[2])
  orientation <- select_orientation(seeds[4])
  spiral      <- select_spiral(seeds[5])
  breaks      <- select_breaks(seeds[6])
  linetype    <- select_linetype(seeds[7])
  lineend     <- select_lineend(seeds[8])
  size        <- select_size(seeds[9])

  trajectory  <- select_trajectory(seeds[3], spiral, size)

  pic <- construct_damage(seed, palette, background, trajectory, orientation,
                          breaks, linetype, lineend)

  if(!is.null(filename)) {
    ggplot2::ggsave(
      filename = filename,
      plot = pic,
      width = pixels/300,
      height = pixels/300,
      dpi = 300
    )
    return(invisible(pic))
  }
  return(pic)
}

construct_damage <- function(seed, palette, background, trajectory, orientation,
                             breaks, linetype, lineend) {
  set.seed(1)

  trajectory %>%
    ggplot2::ggplot(ggplot2::aes(
      x = x0,
      y = y0,
      xend = x1,
      yend = y1,
      colour = shade,
      size = sz
    )) +
    ggplot2::geom_segment(
      show.legend = FALSE,
      lineend = lineend
    ) +
    ggplot2::coord_polar(start = orientation, clip = "off") +
    background(
      palette = palette,
      linetype = linetype
    ) +
    ggplot2::scale_color_gradientn(colours = palette) +
    #ggplot2::scale_size_identity() +
    ggplot2::scale_y_continuous(
      expand = c(0, 0),
      breaks = breaks,
      oob = scales::oob_keep
    ) +
    ggplot2::scale_x_continuous(
      expand = c(0, 0),
      breaks = breaks
    )
}


