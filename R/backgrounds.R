
select_background <- function(seed) {
  set.seed(seed)
  themes <- list(
    theme_white,
    theme_faint,
    theme_contour,
    theme_spoke
  )
  ind <- sample(1:length(themes), 1)
  return(themes[[ind]])
}

theme_white <- function(...) {
  ggplot2::theme_void() +
    ggplot2::theme(
      panel.background = ggplot2::element_rect(
        fill = "white",
        colour = "white"
      )
    )
}

theme_faint <- function(palette, ...) {

  bg <- palette %>%
    sample(size = 1) %>%
    colorspace::lighten(amount = .95)

  ggplot2::theme_void() +
    ggplot2::theme(
      panel.background = ggplot2::element_rect(
        fill = bg,
        colour = bg
      )
    )
}

theme_contour <- function(linetype, ...) {
  ggplot2::theme_void() +
    ggplot2::theme(
      panel.background = ggplot2::element_rect(
        fill = "white",
        colour = "white"
      ),
      panel.grid.major.y = ggplot2::element_line(
        colour = "grey50",
        size = .2,
        linetype = linetype
      )
    )
}

theme_spoke <- function(linetype, ...) {
  ggplot2::theme_void() +
    ggplot2::theme(
      panel.background = ggplot2::element_rect(
        fill = "white",
        colour = "white"
      ),
      panel.grid.major.x = ggplot2::element_line(
        colour = "grey50",
        size = .2,
        linetype = linetype
      )
    )
}



