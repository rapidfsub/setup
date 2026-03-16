options(repos = c(CRAN = "https://ftp.kaist.ac.kr/CRAN/"))

if (!requireNamespace("pak", quietly = TRUE)) {
  install.packages("pak")
}

packages <- c(
  "corrplot",
  "dplyr",
  "forecast",
  "ggplot2",
  "httr",
  "IRkernel",
  "languageserver",
  "rmarkdown",
  "purrr",
  "rpart",
  "rvest",
  "stopwords",
  "textstem",
  "tidytext",
  "tseries",
  "wordcloud",
  "XML"
)

pak::pkg_install(packages)
IRkernel::installspec()

pak::repo_add("http://datacube.wu.ac.at")
pak::pkg_install("tm.corpus.Reuters21578")
