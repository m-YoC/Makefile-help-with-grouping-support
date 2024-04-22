
###> command group 1

commandA: ## commentA
	:
commandB: ## commentB
	:

###> command group 2

commandC: ## commentC
	:
commandD: ## commentD
	:

# groupingの無効化
###> @

commandE: ## commentE
	:
commandF: ## commentF
	:

# --------------------------------------------------------------------------------
# newline (groupingも無効化される)
###>
.DEFAULT_GOAL := help
# head, cut, xargs, grep, gawkコマンドがインストールされている必要があります
help: ## Display this help screen
	@head -n 2 mfhelp.awk | cut -c 2- | xargs -i grep -E '{}' $(MAKEFILE_LIST) | awk -f mfhelp.awk
