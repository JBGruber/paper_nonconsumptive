# Sharing *is* Caring (about Research): Four Avenues for Sharing Text Collections and the Need for Non-Consumptive Research

Render with:

```
# get template
quarto add vanatteveldt/ccr-quarto
# get missing files
curl  -o _extensions/citeproc.lua https://raw.githubusercontent.com/andrewheiss/quarto-wordcount/main/_extensions/wordcount/citeproc.lua
curl  -o _extensions/wordcount.lua https://raw.githubusercontent.com/andrewheiss/quarto-wordcount/main/_extensions/wordcount/wordcount.lua
curl  -O https://raw.githubusercontent.com/ccr-journal/ccr-quarto/main/aup_logo.pdf
# render
quarto render non-consumptive.qmd
```