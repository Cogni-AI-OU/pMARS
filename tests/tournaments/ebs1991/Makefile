SIMULATE = ./simulate.sh

.PHONY: all simulate test

all: simulate

simulate:
	@bash $(SIMULATE)

test:
	@cd ../../../src && make server
	python3 test.py
