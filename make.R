

# Project setup ----

# Create a description file
## NB: check_name = FALSE because we are not creating a package
# usethis::use_description(check_name = FALSE) 

# Create a readme file
# usethis::use_readme_md()

# Create compendium folders
#lapply(c("data", "R", "analyses","analyses/pipeline", "outputs", "data/notebook", "data/sacrois"), # elements I want to apply the function to
#      dir.create, showWarnings = FALSE) # the function


# Use renv with DESCRIPTION file (explicit use of renv)
# renv::init()


# debug renv on windows
# options(renv.download.override = utils::download.file)

# Create R functions in the R repository
# usethis::use_r("XXXX")


# Development commands----

# Load packages from DESCRIPTION file
# renv::install() 
# renv::snapshot(prompt = FALSE)



# workflow ----


# Titre projet
# Description projet

load_data()

