## code to prepare `colores` dataset goes here

library(magrittr)
path <- here::here("data-raw", "canva_palettes.csv")
csv <- readr::read_csv(path, col_names = FALSE)
lst <- purrr::transpose(csv)
lst <- purrr::map(lst, ~unname(unlist(.x)))
dat <- tibble::as_tibble(lst, .name_repair = "unique")
dat <- dat[!duplicated(dat), ]
names(dat) <- c(
  "url",
  "name_1", "colour_1",
  "name_2", "colour_2",
  "name_3", "colour_3",
  "name_4", "colour_4"
)
dat <- dat %>%
  dplyr::mutate(
    palette_name = url %>%
      stringr::str_remove_all("/$") %>%
      stringr::str_remove_all(".*/"),
    palette_index = dplyr::row_number()
  )

dat <- dat %>%
  tidyr::pivot_longer(
    cols = tidyselect::matches("(^name|^colour)"),
    names_to = "variable",
    values_to = "value"
  ) %>%
  tidyr::separate(variable, into = c("type", "position")) %>%
  tidyr::pivot_wider(
    names_from = type,
    values_from = value
  ) %>%
  dplyr::rename(
    colour_name = name,
    colour_index = position
  ) %>%
  dplyr::relocate(palette_name, colour_name, colour, palette_index, colour_index, url) %>%
  dplyr::mutate(colour_index = as.integer(colour_index))


colores <- dat
usethis::use_data(colores, overwrite = TRUE)
