

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
# usethis::use_r("load_data")
<<<<<<< HEAD
# usethis::use_r("change_capture")
# usethis::use_r("change_effort")
=======
# usethis::use_r("change_encoding")
# usethis::use_r("metiers")
>>>>>>> f3d6cb11468a0ae6c485a6adb5d8c113929ee167


# Development commands----

# Load packages from DESCRIPTION file
# renv::install() 
# renv::snapshot(prompt = FALSE)

# Scan r files and complete import section of DESCRIPTION
## ren the 3 following lines
#renv::deactivate()
#rcompendium::add.dependencies()
#renv::activate()



# workflow ----

# install dependencies listed in DESCRIPTION.R
devtools::install_deps(upgrade="never")

# Load project addins (R functions and packages)
devtools::load_all(here::here())

# Configure target for this project
targets::tar_config_set(script = "analyses/pipeline.R",
                        store = "outputs/pipeline")

targets::tar_visnetwork() # targets_only = TRUE
targets::tar_make()


