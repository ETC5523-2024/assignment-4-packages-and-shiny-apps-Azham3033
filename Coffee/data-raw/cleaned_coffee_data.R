library(tidyverse)
coffee_data <- readr::read_csv("data-raw/coffee_survey.csv")

coffee_survey<-coffee_data%>% mutate(id=row_number())
coffee_survey_filtered<- coffee_survey %>% select(id,age,cups,brew,gender,purchase,total_spend,spent_equipment,favorite)


coffee_filtered <- coffee_survey_filtered %>%
  filter(gender %in% c("Male", "Female"))

age_order <- c("<18 years old", "18-24 years old", "25-34 years old", "35-44 years old", "45-54 years old", "55-64 years old", ">65 years old")

coffee_filtered$age <- factor(coffee_filtered$age, levels = age_order)



usethis::use_data(coffee_filtered, overwrite = TRUE)

