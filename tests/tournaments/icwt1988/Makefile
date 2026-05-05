test:
	@bash simulate.sh

check:
	@for f in ../../../warriors/tournaments/icwt1988/*.red; do \
		../../../src/pmars -8 -s 8192 -p 64 -c 50000 -r 10 -l 1000 -b "$$f" "$$f" > /dev/null || echo "Failed: $$f"; \
	done

fix:
	@python3 fix.py