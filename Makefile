# makefile



all : *.Rnw 000_vc.tex
	Rnw2pdf.sh main.Rnw

000_vc.tex : ./.git/logs/HEAD # will be updated after a git commit

	# update the git hash in vc.tex for use in the tex files
	# modified from http://thorehusfeldt.net/2011/05/13/including-git-revision-identifiers-in-latex/ (retrieved on 2013-02-15)

	git log -1 --format="format:\\gdef\\GitAbbrHash{%h}" > 000_vc.tex

clean :
	rm 000_vc.tex
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


