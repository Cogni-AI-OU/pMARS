WARRIOR_DIR = ../../../warriors/tournaments/icwt1989

test:
	@cd ../../../src && make server
	python3 test.py

test-sh:
	@bash simulate.sh

debug:
	-../../../src/pmars -8 -f -s 8000 -l 1000 -r 10 -b $(WARRIOR_DIR)/wang1.red $(WARRIOR_DIR)/wang1.red
	-../../../src/pmars -8 -f -s 8000 -l 1000 -r 10 -b $(WARRIOR_DIR)/bruin.red $(WARRIOR_DIR)/bruin.red
	-../../../src/pmars -8 -f -s 8000 -l 1000 -r 10 -b $(WARRIOR_DIR)/sad2.red $(WARRIOR_DIR)/sad2.red
	-../../../src/pmars -8 -f -s 8000 -l 1000 -r 10 -b $(WARRIOR_DIR)/hamlin.red $(WARRIOR_DIR)/hamlin.red
