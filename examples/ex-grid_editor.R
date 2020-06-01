library(toastui)

# Example data
dat <- data.frame(
  character = month.name,
  select = month.name,
  checkbox = month.abb,
  radio = month.name,
  password = month.name
)


datagrid(dat) %>% 
  grid_editor(
    column = "character",
    type = "text"
  ) %>% 
  grid_editor(
    column = "select",
    type = "select",
    choices = month.name
  ) %>% 
  grid_editor(
    column = "checkbox",
    type = "checkbox",
    choices = month.abb
  ) %>% 
  grid_editor(
    column = "radio",
    type = "radio",
    choices = month.name
  ) %>% 
  grid_editor(
    column = "password",
    type = "password"
  )

