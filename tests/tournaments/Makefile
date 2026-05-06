TOURNAMENTS = acwt1997 icwt1987 icwt1989 icwt1990 icwt1991 icwt1992 kofacoto

test:
	@for t in $(TOURNAMENTS); do \
		echo "Running tests for $$t..."; \
		$(MAKE) -C $$t test || exit 1; \
	done
