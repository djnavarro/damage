

select_palette <- function(seed) {
  set.seed(seed)
  n <- sample(1:8, 1)
  palette_name <- sample(unique(colores$palette_name), 1)
  palette_base <- colores$colour[colores$palette_name == palette_name]
  palette_fn <- grDevices::colorRampPalette(palette_base)
  shades <- palette_fn(n)
  return(shades)
}
