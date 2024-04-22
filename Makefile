
###> command group 1

commandA: ## descriptionA
	:
commandB: ## descriptionB
	:

###> command group 2

commandC: ## descriptionC
	:
commandD: ## descriptionD
	:

# Disable grouping mode
###> @

commandE: ## descriptionE
	:
commandF: ## descriptionF
	:

# --------------------------------------------------------------------------------
# newline (Grouping mode is also disabled)
###>
.DEFAULT_GOAL := help
# Necessary commands: NecessaryNecessaryhead, cut, xargs, grep, gawk
help: ## Display this help screen
	@head -n 2 mfhelp.awk | cut -c 2- | xargs -i grep -E '{}' $(MAKEFILE_LIST) | awk -f mfhelp.awk
