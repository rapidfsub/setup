options(repos = c(CRAN = "https://ftp.kaist.ac.kr/CRAN/"))

if (!requireNamespace("pak", quietly = TRUE)) {
  install.packages("pak")
}

packages <- c(
  "ggplot2",
  "IRkernel",
  "languageserver",
  "rmarkdown",
  "purrr",
  "stopwords",
  "textstem",
  "tidytext",
  "wordcloud"
)

pak::pkg_install(packages)
