all: hello world test

hello:
	@./hello.sh && { echo "success!" | ./notification.sh ; exit 0; } || { echo "failure!" | ./notification.sh ; exit 1; }

world:
	@./world.sh && { echo "success!" | ./notification.sh ; exit 0; } || { echo "failure!" | ./notification.sh ; exit 1; }

test:
	@/bin/false && echo "success!" || { echo "failure!" | ./notification.sh ; exit 1; }
