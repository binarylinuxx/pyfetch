#!/bin/make
# PyFetch Makefile
BIN_NAME = pyfetch
INSTALL_DIR = /usr/bin
CONFIG_DIR = /etc/pyfetch

install:
	@echo "Installing PyFetch..."
	@mkdir -p $(CONFIG_DIR)
	@cp pyfetch $(INSTALL_DIR)/$(BIN_NAME)
	@chmod +x $(INSTALL_DIR)/$(BIN_NAME)
	@cp config.ini $(CONFIG_DIR)/config.ini
	@echo "Installation complete! Run with '$(BIN_NAME)'"

uninstall:
	@echo "Removing PyFetch..."
	@rm -f $(INSTALL_DIR)/$(BIN_NAME)
	@rm -rf $(CONFIG_DIR)
	@echo "PyFetch has been removed"

test:
	@python3 pyfetch.py
