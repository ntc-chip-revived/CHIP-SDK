BLACK				=	$(shell tput setaf 0)
RED					=	$(shell tput setaf 1)
GREEN				=	$(shell tput setaf 2)
YELLOW				=	$(shell tput setaf 3)
BLUE				=	$(shell tput setaf 4)
MAGENTA				=	$(shell tput setaf 5)
CYAN				=	$(shell tput setaf 6)
WHITE				=	$(shell tput setaf 7)
RESET				=	$(shell tput sgr0)

TOPDIR				:=	$(shell pwd)

BR_DIRECTORY			:=	$(TOPDIR)/components/buildroot
OUTPUT_DIRECTORY		:=	$(TOPDIR)/output
EXTERNAL_DIRECTORY		:=	$(TOPDIR)/components
LOG_DIRECTORY		:=	$(TOPDIR)/logs

LOG_NAME			:=	$(TOPDIR)/logs/`date +"%d-%m-%Y-%s"`

BR2_LINUX_KERNEL_PATCH		:=	$(TOPDIR)/components/patches/linux/*
MAKE_BR				:=	BR2_LINUX_KERNEL_PATCH=$(BR2_LINUX_KERNEL_PATCH) make --silent -C $(BR_DIRECTORY) BR2_EXTERNAL=$(EXTERNAL_DIRECTORY) O=$(OUTPUT_DIRECTORY)
BR_TARGETS			:=	$(shell $(MAKE_BR) show-targets)



all: buildroot-make


%_defconfig: $(BR_DIRECTORY)/configs/%_defconfig
	@echo '=== Copying $@ ==='
	@$(MAKE_BR) $@ > $(LOG_NAME) 2>&1

menuconfig:
	@$(MAKE_BR) menuconfig

nconfig:
	@$(MAKE_BR) nconfig

gconfig:
	@$(MAKE_BR) gconfig

%_package:
	@echo "$(GREEN)==>$(BLUE) Building $(MAGENTA)$(subst _package,,$*)$(RESET)"
	@$(MAKE_BR) $(subst _package,,$*) > $(LOG_NAME)-$(subst _package,,$*).log 2>&1

build-header:
	@echo "$(GREEN)=>$(BLUE) Building Packages$(RESET)"

buildroot-make: sources build-header $(addsuffix _package,$(BR_TARGETS) )
	@echo "$(GREEN)=>$(BLUE) Build complete$(RESET)"
	@echo "$(GREEN)=>$(BLUE) Output available at $(YELLOW)\`$(OUTPUT_DIRECTORY)\`$(RESET)"

show-targets:
	@$(foreach p, $(BR_TARGETS), echo $(p);)

sources-header:
	@echo "$(GREEN)=>$(BLUE) Downloading Source Files$(RESET)"

sources: sources-header
	@echo "$(GREEN)=>$(BLUE) Download complete$(RESET)"
	@$(MAKE_BR) source > $(LOG_NAME) 2>&1

graph:
	@$(MAKE_BR) show-depends

clean:
	@echo "=> Cleaning output directory"
	@$(MAKE_BR) clean > $(LOG_NAME) 2>&1
	@rm -rf $(LOG_DIRECTORY)/*