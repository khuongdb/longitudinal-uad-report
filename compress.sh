#!/bin/bash

# Check if the correct number of arguments are provided
# if [ "$#" -lt 2 ]; then
#     echo "Usage: $0 input.pdf output.pdf [quality]"
#     echo "Quality options: screen, ebook, printer, prepress (default: screen)"
#     exit 1
# fi

INPUT="${1:-main.pdf}"  # default to 'main.pdf' produced by pdftex
OUTPUT="${2:-internship-report-DANG-Ba-Khuong.pdf}"  
QUALITY="${3:-printer}"  # default to 'screen' if not provided

# Map quality string to Ghostscript preset
case "$QUALITY" in
    screen) PDFSETTING="/screen" ;;
    ebook) PDFSETTING="/ebook" ;;
    printer) PDFSETTING="/printer" ;;
    prepress) PDFSETTING="/prepress" ;;
    *) 
        echo "Invalid quality option. Using 'screen'."
        PDFSETTING="/screen"
        ;;
esac

# Run Ghostscript to compress the PDF
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
   -dPDFSETTINGS=$PDFSETTING \
   -dNOPAUSE -dQUIET -dBATCH \
   -sOutputFile="$OUTPUT" "$INPUT"

echo "Compressed PDF saved as $OUTPUT"
