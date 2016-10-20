KnitPost <- function(input, base.url = "/") {
  require(knitr)
  opts_knit$set(base.url = base.url)
  # fig.path <- paste("../images/blog/", sub(".Rmd$", "", basename(input)), "/", sep="")
  # opts_chunk$set(fig.path = fig.path)
  opts_chunk$set(fig.cap = "center", fig.path = paste0("figure/", strsplit(files, "[.]")[[1]][1], "-"))
  render_jekyll()
  knit(input, envir = parent.frame())
}
files <- list.files(".", pattern = "*.Rmd")
files <- files[files != "LastnameFirstname.Rmd"]
for(file in files) KnitPost(file, base.url = "")
