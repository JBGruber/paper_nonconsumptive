lines <- readLines("non-consumptive.tex")

rm <- grep("\\abstract{", lines, fixed = TRUE):grep("{\\end{tcolorbox}}\\fi", lines, fixed = TRUE)
lines <- lines[-rm]

abstract <- "A decade ago, the computational turn in communication science
was heralded by promises of unseen treasure troves of available digital
text containing communication of journalists and social media users. As
these treasures become more closly guarded today, the field needs to
think of new strategies to continue to enable researchers who want to
engage in computational communication research. One of these strategies
is to make text data sharing a more common practice in the field. In
this article, we outline three avenues to share as much as your data as
possible, while still honouring ehtical and legal restictions. Given the
relative lack of infrastructure for some of these avenues, we also
highlight the capacities of the Amsterdam Content Analysis Toolkit
(AmCAT) to enable non standard sharing strategies. We especially
highlight the functions for \\emph{non-consumptive research} -- which
means analyses methods that can be performed without access to the full
data set.\n\n \\section{Introduction}"

lines[rm[1]] <- abstract

body_start <- grep("begin{document}", lines, fixed = TRUE)
body_end <- grep("end{document}", lines, fixed = TRUE)

body <- lines[(body_start + 1):(body_end - 1)] |> 
  paste0(collapse = "\n")

template <- readLines("non-consumptive_opted_template.tex")
gsub("$body$", body, template, fixed = TRUE) |> 
  writeLines("temp.tex")
tinytex::pdflatex("temp.tex")
file.rename("temp.pdf", "OPTED-D7.6.pdf")
list.files(path = ".", pattern = "^temp") |> 
  file.remove()
