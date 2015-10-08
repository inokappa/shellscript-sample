default:
	@echo Makefile for MyTask
	@echo
	@echo Usage: make [task]
	@echo
	@echo Tasks:
	@./make_tasks.py < Makefile

all: hello world # Execute all tasks

hello: # Execute hello
	@./hello.sh && { echo "success!" ; exit 0; } || { echo "failure!" | ./notification.sh ; exit 1; }

world: hello # Execute world
	@./world.sh && { echo "success!" | ./notification.sh ; exit 0; } || { echo "failure!" | ./notification.sh ; exit 1; }
