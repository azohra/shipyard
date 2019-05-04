.PHONY: all exec test

all: exec test   

exec:
	@chmod u+x shipyard

test:
	@shellcheck shipyard
