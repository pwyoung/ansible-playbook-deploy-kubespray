MAKEFILE_PATH=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
.PHONY=test clean

test:
	$(info Test)
	make -C $(MAKEFILE_PATH)/tests/run-all

clean:
	$(info Clean)
	make -C $(MAKEFILE_PATH)/tests/run-all clean
