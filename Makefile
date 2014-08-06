run: build
	./ci.native -p 9000 -d
build: server/ci.ml
	corebuild -pkg opium,cow.syntax -I server ci.native
deps:
	opam install opium ounit2
