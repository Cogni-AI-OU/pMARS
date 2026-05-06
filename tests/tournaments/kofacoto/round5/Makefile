WARRIOR_DIR = '../../../../warriors/tournaments/kofacoto/round5'

test:
	@cd ../../../../src && make server
	python3 test.py

debug:
	-../../../../src/pmars -f -s 8000 -c 80000 -p 8000 -l 100 -r 200 -b $(WARRIOR_DIR)/Macrae.red $(WARRIOR_DIR)/Kline.red
