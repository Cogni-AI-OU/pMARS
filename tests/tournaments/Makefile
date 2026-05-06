TOURNAMENTS = acwt1997 icwt1987 icwt1989 icwt1990 icwt1991 icwt1992 kofacoto/round3 kofacoto/round4 kofacoto/round5 kofacoto/round6 kofacoto/round7

test:
	@for t in $(TOURNAMENTS); do \
		echo "Running tests for $$t..."; \
		$(MAKE) -C $$t test || exit 1; \
	done
