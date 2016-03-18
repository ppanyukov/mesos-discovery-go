all:	test

install:
	go install ./hellolib

test:
	go test ./hellolib 

clean:
	go clean ./...

nuke:
	go clean -i ./...
