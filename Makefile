all: help

name = $(shell basename $(shell pwd))
prefix = /usr/local

help:
	@echo '=== Targets'
	@echo
	@echo '# initialize pyproject from template'
	@echo '  init [ name=<name> ] 			# default: name=$$(basename $$(pwd))'

init: clean
ifeq ($(shell basename $(shell pwd)),pyproject-pub)
	$(error won't initialize pyproject-pub in-place)
endif
	./rename.sh $(name)

	rm -f $$(find -maxdepth 1 -type f)

	rsync -a example/ ./
	rm -rf example/

	rm -rf .git
	git init
	git add .
	git commit -m "Initialized project '$(name)' from template"

uninstall:
	rm -rf $(PATH_INSTALL_SHARE)

clean:
	rm -rf build

.PHONY: help init clean 
