library(toastui)

validate <- data.frame(
  col_text = c("a", "b", "a", NA, "c"),
  col_number = sample(1:10, 5),
  col_mail = c("victor@mail.com", "victor", NA, "victor@mail", "victor.fr")
)

datagrid(validate) %>%
  grid_editor(
    "col_text", type = "text",
    validation = validateOpts(required = TRUE, unique = TRUE)
  ) %>%
  grid_editor(
    "col_number", type = "number",
    validation = validateOpts(min = 0, max = 5)
  ) %>%
  grid_editor(
    "col_mail", type = "text",
    validation = validateOpts(
      regExp = "^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$"
    )
  )
