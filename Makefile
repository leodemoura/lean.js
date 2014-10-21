INSTALL_PREFIX=/var/www/html/

all: lean.js

gmp: libs/libgmp.so

mpfr: libs/libmpfr.so

lua: libs/liblua.so

lean: build/lean/source/lean-master/shell/lean

lean.js: build/lean_js/source/lean-master/shell/lean.js

libs/libgmp.so:
	python build_all.py gmp

libs/libmpfr.so:
	python build_all.py mpfr

libs/liblua.so:
	python build_all.py lua

build/lean/source/lean-master/library.tar.gz: build/lean/source/lean-master/shell/lean 
	cd build/lean/source/lean-master/library && ../bin/linja clean && ../bin/linja -X 
	cd build/lean/source/lean-master && tar cvfz library.tar.gz `find library -name "*.olean"` 

build/lean/source/lean-master/shell/lean: build/lean/source/lean-master/Makefile
	python build_all.py lean || emmake make -C build/lean/source/lean-master/ || emmake make -C build/lean/source/lean-master/ || emmake make -C build/lean/source/lean-master/

build/lean_js/source/lean-master/shell/lean.js: gmp mpfr lua build/lean/source/lean-master/library.tar.gz
	python build_all.py lean_js
	cd build/lean_js/source/lean-master/shell && tar xvfz ../../../../lean/source/lean-master/library.tar.gz
	rm -rf build/lean_js/source/lean-master/shell/lean.*
	emmake make -C build/lean_js/source/lean-master/ || emmake make -C build/lean_js/source/lean-master/ || emmake make -C build/lean_js/source/lean-master/

install: build/lean_js/source/lean-master/shell/lean.js
	cp -v build/lean_js/source/lean-master/shell/lean.js  $(INSTALL_PREFIX)

push: 
	git co gh-pages
	git reset --hard origin/gh-pages~
	cp build/lean_js/source/lean-master/shell/lean.js lean.js
	git add lean.js
	git ci -m "Update `date -R`"
	git push --force origin gh-pages:gh-pages
	git co master

clean:
	rm -rf build libs includes

.PHONY: all gmp mpfr lua lean lean.js clean
