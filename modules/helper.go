package modules

import (
	"bytes"
	"encoding/gob"
	"github.com/satori/go.uuid"
	"regexp"
	"strconv"
	"strings"
)

// InArray ...
func InArray(arr []string, str string) bool {
	for _, v := range arr {
		if v == str {
			return true
		}
	}
	return false
}

// InArrayWithoutEmpty ...
func InArrayWithoutEmpty(arr []string, str string) bool {
	if len(arr) == 0 {
		return true
	}
	for _, v := range arr {
		if v == str {
			return true
		}
	}
	return false
}

// RemoveBlankFromArray ...
func RemoveBlankFromArray(s []string) []string {
	var r []string
	for _, str := range s {
		if str != "" {
			r = append(r, str)
		}
	}
	return r
}

// IsInfoUrl ...
func IsInfoUrl(s string) bool {
	reg, _ := regexp.Compile("(.*?)info/(.*?)$")
	sub := reg.FindStringSubmatch(s)
	return len(sub) > 2 && !strings.Contains(sub[2], "/")
}

// IsNewUrl ...
func IsNewUrl(s string, p string) bool {
	reg, _ := regexp.Compile("(.*?)info/" + p + "/new")
	return reg.MatchString(s)
}

// IsEditUrl ...
func IsEditUrl(s string, p string) bool {
	reg, _ := regexp.Compile("(.*?)info/" + p + "/edit")
	return reg.MatchString(s)
}

// Uuid ...
func Uuid() string {
	return uuid.NewV4().String()
}

// SetDefault ...
func SetDefault(source, def string) string {
	if source == "" {
		return def
	}
	return source
}

// GetPage ...
func GetPage(page string) (pageInt int) {
	if page == "" {
		pageInt = 1
	} else {
		pageInt, _ = strconv.Atoi(page)
	}
	return
}

// CopyMap ...
func CopyMap(m map[string]string) map[string]string {
	var buf bytes.Buffer
	enc := gob.NewEncoder(&buf)
	dec := gob.NewDecoder(&buf)
	err := enc.Encode(m)
	if err != nil {
		panic(err)
	}
	var cm map[string]string
	err = dec.Decode(&cm)
	if err != nil {
		panic(err)
	}
	return cm
}

// AorB ...
func AorB(condition bool, a string, b string) string {
	if condition {
		return a
	}
	return b
}
