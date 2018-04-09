@echo off

echo Execute perl file
echo
perl convertToPdf_Pat.pl "Storyboard.html" "Patrick Steiner und Marco Frank"

set root="C:Program Files\wkhtmltopdf\bin\"
echo Navigate to folder
cd /d %root%
echo %cd%
echo

echo Generate pdf file
wkhtmltopdf.exe "U:\Dokumente\M152\HomageGIBZ\output.html" "U:\Dokumente\M152\HomageGIBZ\Storyboard.pdf"

echo Delete output file
del "U:\Dokumente\M152\HomageGIBZ\output.html"