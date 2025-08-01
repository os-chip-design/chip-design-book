
doit:
	librelane adder.json

view:
	librelane --last-run --flow openinklayout adder.json

mem:
	librelane memory.yaml

mem-view:
	librelane --last-run --flow openinklayout memory.yaml

version:
	python version.py

summary:
	PDK_ROOT=~/.ciel ~/learning/zero2asic/openlane_summary/summary.py --help

# Matt has a nicer setup in KLayout than the standard thing. But is this common?
abc:
	klayout -l ~/learning/zero2asic/openlane_summary/klayout_gds.xml runs/RUN_2025-07-23_22-00-57/final/klayout_gds/adder.klayout.gds 


clean:
	rm -rf runs
