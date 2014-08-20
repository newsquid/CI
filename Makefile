run: build
	./ci.native -p 9000 -d
build: server
	corebuild -pkg opium,cow.syntax -I server ci.native
deps:
	opam install core async opium ounit2
