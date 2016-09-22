SUBDIRS = src examples

install-data-local:
	if test -d $(srcdir)/PDFsets; then \
	for i in `find $(srcdir)/PDFsets -name "*.LH*" -type f`; do \
	$(install_sh_DATA) $$i $(DESTDIR)$(pkgdatadir)/PDFsets/$${i#$(srcdir)/PDFsets/}; \
	done; \
	fi

uninstall-local:
	rm -rf $(DESTDIR)$(pkgdatadir)/PDFsets; \
	test ! -d $(DESTDIR)$(pkgdatadir) || rmdir --ignore-fail-on-non-empty $(DESTDIR)$(pkgdatadir)

dists: dist
	cp $(distdir).tar.gz $(distdir)-nopdf.tar.gz
	gunzip $(distdir).tar.gz; 
	ln -s $(srcdir) $(srcdir)/$(distdir)
	tar rf $(distdir).tar `find $(distdir)/PDFsets -follow -type f -not \( -path "*/CVS*" -or -path "*/.svn*" \)`
	gzip $(distdir).tar
	rm -f $(srcdir)/$(distdir)



