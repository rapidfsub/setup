options(repos = c(CRAN = "https://ftp.kaist.ac.kr/CRAN/"))

if (!requireNamespace("pak", quietly = TRUE)) {
  install.packages("pak")
}

packages <- c(
  "ggplot2",
  "languageserver",
  "rmarkdown",
  "purrr",
  "stopwords",
  "textstem"
)

pak::pkg_install(packages)
