
function uncompress_pdf() {
  PDF_IN="$1"
  PDF_OUT="${PDF_IN%.pdf}_uncompressed.pdf"
  pdftk $PDF_IN output $PDF_OUT uncompress
}

function compress_pdf() {
  PDF_IN="$1"
  PDF_OUT="${PDF_IN%.pdf}_compressed.pdf"
  pdftk $PDF_IN output $PDF_OUT compress
}
