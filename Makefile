all: openwith

PREFIX?=/usr/local

%_x86_64: %.swift
	swiftc -Osize -target x86_64-apple-macosx11.0 -o $@ $<

%_arm64:  %.swift
	swiftc -Osize -target arm64-apple-macosx11.0  -o $@ $<

%: %_x86_64 %_arm64
	lipo -create $^ -o $@
	strip $@

$(DESTDIR)$(PREFIX)/bin/openwith: openwith
	install -m 0755 $< $@

install: $(DESTDIR)$(PREFIX)/bin/openwith

version:
	ruby -ne 'return if File.write("version", $$_.match(/openwith: (.*)$$/){$$1})' openwith.swift

.PHONY: release
release: version
	tar -cJf openwith-$(shell cat version).tar.xz openwith
	rm -f version

.PHONY: clean
clean: openwith
	rm -f $^
