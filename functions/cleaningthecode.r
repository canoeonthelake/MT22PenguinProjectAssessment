#The function to initially clean the data
cleaning <- function(penguins_raw){
  penguins_raw %>% 
    clean_names() %>%  #a function from the janitor package that removes capital letters
    remove_empty(c("rows", "cols")) %>% #removes columns and rows that have empty cells
    dplyr::select(-starts_with("delta")) %>% #removes columns that start with "delta" using the select function from the dplyr package
    dplyr::select(-comments)  #removes the column called "comments" using the select function from the dplyr package
}


#Function for removing NAs from the body mass and sex column and subsetting for just the species, body mass and bill length columns

bodymass_bills <- function(data_clean){
  data_clean %>%
    filter(!is.na(culmen_length_mm)) %>% #removes rows in culmen_length_mm that have "NA" in cells
    filter(!is.na(body_mass_g)) %>% #removes rows in body_mass_g that have "NA" in cells
    dplyr::select(species, body_mass_g, culmen_length_mm) %>%  #keeps the columns with species, body mass and culmen (bill) length)
    filter(species =="Gentoo penguin (Pygoscelis papua)") #just keeping the rows about gentoo penguins
}
