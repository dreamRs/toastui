
library(fs)

files_min <- list.files(
  path = "node_modules", 
  pattern = "\\.min\\.", 
  full.names = FALSE, 
  recursive = TRUE
)
files_license <- list.files(
  path = "node_modules", 
  pattern = "LICENSE", 
  full.names = FALSE, 
  recursive = TRUE
)
files_license <- grep("tui-code-snippet", files_license, value = TRUE, invert = TRUE)


dir_create(
  path = dirname(file.path("inst/htmlwidgets/assets", files_min))
)
file_copy(
  path = file.path("node_modules", files_min),
  new_path = file.path("inst/htmlwidgets/assets", files_min), 
  overwrite = TRUE
)
file_copy(
  path = file.path("node_modules", files_license),
  new_path = file.path("inst/htmlwidgets/assets", files_license), 
  overwrite = TRUE
)
