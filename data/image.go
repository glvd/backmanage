package data

import (
	"bufio"
	"encoding/base64"
	"github.com/goextension/log"
	"io/ioutil"
	"os"
)

// ImageLoad ...
func ImageLoad(path string) string {
	log.Infow("image_load", "path", path)
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
