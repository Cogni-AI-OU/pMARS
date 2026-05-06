TOURNAMENTS = acwt1997 icwt1987 icwt1988 icwt1989 icwt1990 icwt1991 icwt1992 kofacoto

.PHONY: all test $(TOURNAMENTS)

test: $(TOURNAMENTS)

$(TOURNAMENTS):
	@echo "Running tests for $@..."
	@$(MAKE) -C $@ test

