package hellolib_test

import (
	"testing"

	"github.com/ppanyukov/mesos-discovery-go/hellolib"
)

type Expectation struct {
	input        string
	expectOutput string
}

func TestSayHello(t *testing.T) {
	expectations := []Expectation{
		{"foo", "Hello, foo!"},
		{"bar", "Hello, bar!"}}

	for _, e := range expectations {
		actual := hellolib.SayHello(e.input)
		if actual != e.expectOutput {
			t.Errorf("Failed test for input '%s'. Expected:'%s'. Actual: '%s'", e.input, e.expectOutput, actual)
		}
	}
}
