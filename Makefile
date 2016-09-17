VERSION = 0.7
INSTALL = /usr/bin/install -c
prefix = /usr
bindir = /usr/bin
exec_prefix = /usr
mandir = /usr/share/man
top_srcdir = .
SHELL = /bin/sh
PWD := $(shell pwd)
mkinstalldirs = $(SHELL) $(top_srcdir)/mkinstalldirs
fake:
	echo
install:
	$(mkinstalldirs) $(DESTDIR)$(bindir)
	$(mkinstalldirs) $(DESTDIR)$(mandir)/man1
	${INSTALL} ldaplist $(DESTDIR)${bindir}
	${INSTALL} ldaplist.1 $(DESTDIR)${mandir}/man1

bytecode:
	echo "import py_compile; py_compile.compile('ldaplist')" | python
deb:
	dpkg-buildpackage -rfakeroot
rpm:
	ln -s . ldaplist-$(VERSION)
	tar --exclude-vcs -zcf ~/rpmbuild/SOURCES/ldaplist-$(VERSION).tar.gz .
	cd ~/rpmbuild/SOURCES/; rpmbuild -tb --sign --rmsource --clean ldaplist-$(VERSION).tar.gz
	rm ldaplist-$(VERSION)
version:
	sed -i 's/Version: .*/Version: $(VERSION)/' ldaplist.spec
	sed -i 's/^VERSION=.*/VERSION=$(VERSION)/' ldaplist
	sed -i 's/^VERSION =.*/VERSION = $(VERSION)/' Makefile
	dch -v $(VERSION)
	vi ldaplist.spec
packages: deb rpm
