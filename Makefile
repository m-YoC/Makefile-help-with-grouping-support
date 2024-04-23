
###> 
###> !Sample: Makefile help with grouping support
###>

###> command group 1

commandA: ## descriptionA
	:
commandB: ## descriptionB
	:

###> command group 2

commandC: ## descriptionC #> sub (arg, example, etc...) #> sub2
	:
commandD: ## descriptionD #> sub (arg, example, etc...) #> sub2
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
# Necessary commands: sed, cut, xargs, grep, gawk
help: ## Display this help screen
	@sed -n 2p mfhelp.awk | cut -c 2- | xargs -i grep -E '{}' $(MAKEFILE_LIST) | awk -f mfhelp.awk

to-oneliner: ## create oneliner help command and output to stdout
	@sed -n 2p mfhelp.awk | cut -c 2- | sed -e 's/\$$/\$$\$$/g' | xargs -i echo "@grep -E '{}' \$$(MAKEFILE_LIST) \\"; \
	tail -n +3 mfhelp.awk | tr -d "\n" | tr -s " " | xargs -i -0 echo "| awk '{}'" \
	| fold -s | sed -e 's/\$$/\$$\$$/g' -e 's/^/\t/g' -e 's/ $$/ \\/g'

