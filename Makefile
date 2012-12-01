
all: install_cdb

BUILT_CDB_FILES = devhelp.cdb erdoc.cdb man.cdb

ri.cdb:
	./ri-indexer.rb /usr/share/ri/1.8 /var/lib/gems/1.8/doc | cdb -cu $@

erdoc.cdb:
	./erdoc-indexer.rb /usr/share/doc/erlang | cdb -cu $@

devhelp.cdb:
	./devhelp-indexer.rb /usr/share/gtk-doc/html | cdb -cu $@

man.cdb:
	./man-indexer.rb | cdb -cu $@

install_cdb: $(BUILT_CDB_FILES)
	mkdir -p ~/.supermegadoc
	cp $^ ~/.supermegadoc/

install: supermegadoc
	cp supermegadoc /usr/local/bin/
	ln -f /usr/local/bin/supermegadoc /usr/local/bin/superman

.PHONY: ri.cdb devhelp.cdb erdoc.cdb man.cdb install_cdb
