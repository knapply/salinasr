if("salinasr" %in% installed.packages()[, "Package"]) {
  remove.packages("salinasr")
}

if(dir.exists("docs")) {
  unlink("docs", recursive = TRUE, force = TRUE)
}

if(dir.exists("man")) {
  unlink("man", recursive = TRUE, force = TRUE)
}

devtools::document(".")

devtools::install(".", dependencies = FALSE, upgrade_dependencies = FALSE)

source("data-raw/logo.R")

rmarkdown::render("README.Rmd", output_format = "github_document")

pkgdown::build_site()

