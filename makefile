cucumber:
	@NODE_ENV=test	./node_modules/.bin/cucumber-js	-r	features/step_definitions
.PHONY: cucumber
