.PHONY: all exec test docs

all: exec binary docs test   

exec:
	@chmod u+x src/*.sh

test:
	@shellcheck ./shipyard
	@shellcheck ./src/*.sh

binary:
	@./src/binary.sh