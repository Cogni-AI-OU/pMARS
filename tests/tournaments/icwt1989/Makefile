test:
	@cd ../../../src && make server
	python3 test.py

debug:
	-../../../src/pmars -8 -s 8192 -l 1000 -r 10 -b wang1.red wang1.red
	-../../../src/pmars -8 -s 8192 -l 1000 -r 10 -b bruin.red bruin.red
	-../../../src/pmars -8 -s 8192 -l 1000 -r 10 -b sad2.red sad2.red
	-../../../src/pmars -8 -s 8192 -l 1000 -r 10 -b hamlin.red hamlin.red