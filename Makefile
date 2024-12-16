V=20241216

PREFIX = /usr/local

install:
	install -dm755 $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 asahi-alarm{.gpg,-trusted,-revoked} $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/share/pacman/keyrings/asahi-alarm{.gpg,-trusted,-revoked}
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

dist:
	git archive --format=tar --prefix=asahi-alarm-keyring-$(V)/ $(V) | gzip -9 > asahi-alarm-keyring-$(V).tar.gz
	gpg --detach-sign --use-agent asahi-alarm-keyring-$(V).tar.gz

.PHONY: install uninstall dist upload
