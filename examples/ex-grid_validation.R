library(toastui)

dat <- data.frame(
  number = c("a", 2:10),
  character = c("A", "B", "C", character(7)),
  "min=0 & max=100" = sample(1:150, 10),
  email = c("victor@mail.com", "victor"),
  check.names = FALSE
)


datagrid(dat) %>% 
  grid_editor(
    column = "number",
    type = "text"
  ) %>% 
  grid_validation(
    column = "number", 
    type = "number"
  ) %>% 
  grid_editor(
    column = "character",
    type = "text"
  ) %>% 
  grid_validation(
    column = "character", 
    type = "string", 
    required = TRUE
  ) %>% 
  grid_editor(
    column = "min=0 & max=100",
    type = "text"
  ) %>% 
  grid_validation(
    column = "min=0 & max=100", 
    type = "number",
    min = 0, max = 100
  ) %>%
  grid_editor(
    column = "email",
    type = "text"
  ) %>%
  grid_validation(
    column = "email",
    type = "string",
    regExp = "^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$"
  )

