problem_% : problem_%.hs
	ghc -O3 --make $@

clean :
	rm -f problem_???
	find ./ -iname '*.o' -or -iname '*.dSYM' | xargs rm -fr
