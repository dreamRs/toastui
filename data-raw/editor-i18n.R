
# Read i18n editor's options --------------------------------------------------------

lang <- data.table::fread("data-raw/editor-i18n.txt", header = TRUE)

cat(sprintf("import '@toast-ui/editor/dist/i18n/%s';", tools::file_path_sans_ext(lang[[3]][-1])), sep = "\n")
