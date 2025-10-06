# -*- mode: makefile -*-
# vim:ft=make:

OUTPUT_DIR = .
BASH_DEBUG_PREFACE ?= "In helm bash completion setup"
BASH_OUTPUT_FILENAME ?= helm-completion-setup.bash
ZSH_DEBUG_PREFACE ?= "In helm zsh completion setup"
ZSH_OUTPUT_FILENAME ?= helm-completion-setup.zsh

.PHONY : all
all : bash-completion zsh-completion

.PHONY : bash-completion
bash-completion :
	@echo Generating helm bash completion setup script
	@/bin/echo -e "# -*- mode: sh; sh-shell: bash -*-\\n\
# vim:ft=sh:\\n\
\\n\
# /bin/echo -e '$(BASH_DEBUG_PREFACE)'" > $(OUTPUT_DIR)/$(BASH_OUTPUT_FILENAME) &&\
	helm completion bash >> $(OUTPUT_DIR)/$(BASH_OUTPUT_FILENAME)

.PHONY : zsh-completion
zsh-completion :
	@echo Generating helm ZSH completion setup script
	@/bin/echo -e "# -*- mode: sh; sh-shell: zsh -*-\\n\
# vim:ft=sh:\\n\
\\n\
# /bin/echo -e '$(ZSH_DEBUG_PREFACE)'" > $(OUTPUT_DIR)/$(ZSH_OUTPUT_FILENAME) &&\
	helm completion zsh >> $(OUTPUT_DIR)/$(ZSH_OUTPUT_FILENAME)

.PHONY : clean
clean :
	rm -f $(OUTPUT_DIR)/$(BASH_OUTPUT_FILENAME)
	rm -f $(OUTPUT_DIR)/$(ZSH_OUTPUT_FILENAME)
