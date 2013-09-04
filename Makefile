# makefile



all : *.Rnw 000_vc.tex
	Rnw2pdf.sh main.Rnw

clean :
	rm -f main.tex
	rm -f sweave-concordance.tex
	rm -f *.aux
	rm -f *.log
	rm -f *.lot
	rm -f *.lof
	rm -f *.toc
	rm -f *.out
	rm -f *.bbl
	rm -f *.blg
	rm -rf sweave_cache
	rm -rf sweave_forge


