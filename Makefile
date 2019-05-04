INSTALL_DIR=/usr/local/bin

.PHONY: all install uninstall exec test

all: exec test   

exec:
	@chmod u+x shipyard

test:
	@shellcheck shipyard

install: shipyard
	@echo "📦 Installing shipyard"
	@mkdir -p $(INSTALL_DIR)
	@cp shipyard $(INSTALL_DIR)/shipyard
	@chmod u+x $(INSTALL_DIR)/shipyard

uninstall:
	@echo "🗑️  Uninstalling shipyard"
	@rm $(INSTALL_DIR)/shipyard