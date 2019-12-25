package date

import (
	"bufio"
	"encoding/base64"
	"io/ioutil"
	"os"
)

// ImageLoad ...
func ImageLoad(path string) string {
	open, err := os.Open(path)
	if err != nil {
		return ""
	}

	content, err := ioutil.ReadAll(bufio.NewReader(open))
	if err != nil {
		return ""
	}
	// Encode as base64.
	return base64.StdEncoding.EncodeToString(content)
}
