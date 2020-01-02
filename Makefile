MAKEFILE_PATH=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
.PHONY=test clean FORCE:

test: FORCE
	$(info Test)
	make -C $(MAKEFILE_PATH)/tests/run-all

clean: FORCE
	$(info Clean)
	make -C $(MAKEFILE_PATH)/tests/run-all clean

FORCE:
