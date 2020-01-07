package scrape

import (
	"github.com/javscrape/go-scrape"
	"path/filepath"
)

// Option ...
type Option struct {
	Proxy    string
	Optimize bool
	Exact    bool
	Output   string
}

// Scrape ...
var Scrape scrape.IScrape

// DefaultOption ...
func DefaultOption() Option {
	return Option{
		Proxy:    "socks5://127.0.0.1:1080",
		Optimize: true,
		Exact:    true,
		Output:   filepath.Join("uploads", "info"),
	}
}

// NewScrape ...
func NewScrape(option Option) (s scrape.IScrape) {
	return newScrape(option)
}

// NewScrape ...
func newScrape(option Option) scrape.IScrape {
	if option.Proxy != "" {
		scrape.RegisterProxy(option.Proxy)
	}

	if option.Output != "" {
		scrape.DefaultOutputPath = option.Output
	}

	Scrape = scrape.NewScrape(
		scrape.GrabOption(scrape.NewGrabJavbus()),
		scrape.GrabOption(scrape.NewGrabJavdb()),
		scrape.OptimizeOption(option.Optimize),
		scrape.ExactOption(option.Exact),
	)
	return Scrape
}

// FindContent ...
func FindContent(no string, option Option) (*VideoContent, error) {
	path := filepath.Join("data", "info")
	option.Output = path
	s := NewScrape(option)
	if err := s.Find(no); err != nil {
		return nil, err
	}
	if err := s.Output(); err != nil {
		return nil, err
	}
	return LoadContent(filepath.Join(path, no, ".info"))
}
