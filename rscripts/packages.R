options(repos = c(CRAN = "https://ftp.kaist.ac.kr/CRAN/"))

if (!requireNamespace("pak", quietly = TRUE)) {
  install.packages("pak")
}

packages <- c(
  "dplyr",
  "ggplot2",
  "httr",
  "IRkernel",
  "languageserver",
  "rmarkdown",
  "purrr",
  "rvest",
  "stopwords",
  "textstem",
  "tidytext",
  "wordcloud",
  "XML"
)

pak::pkg_install(packages)
IRkernel::installspec()
