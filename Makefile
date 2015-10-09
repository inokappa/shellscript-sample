default:
	@echo Makefile for MyTask
	@echo
	@echo Usage: make [task]
	@echo
	@echo Tasks:
	@python -c 'import sys;from make_tasks import foo; foo()' < Makefile

all: hello world # Execute all tasks

hello: # Execute hello（タスクの説明）
	@./hello.sh && { echo "success!" ; exit 0; } || { echo "failure!" | ./notification.sh ; exit 1; }

world: hello # Execute world（タスクの説明）
	@./world.sh && { echo "success!" | ./notification.sh ; exit 0; } || { echo "failure!" | ./notification.sh ; exit 1; }
