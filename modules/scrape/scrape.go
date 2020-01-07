package scrape

import (
	"github.com/javscrape/go-scrape"
	"path/filepath"
	"sync"
)

// Option ...
type Option struct {
	Proxy    string
	Optimize bool
	Exact    bool
	Output   string
}

// DefaultOption ...
var DefaultOption = defaultOption()

// Scrape ...
var Scrape scrape.IScrape
var once sync.Once

// DefaultOption ...
func defaultOption() Option {
	return Option{
		Proxy:    "socks5://127.0.0.1:1080",
		Optimize: true,
		Exact:    true,
		Output:   filepath.Join("uploads", "info"),
	}
}

// NewScrape ...
func NewScrape() (s scrape.IScrape) {
	once.Do(func() {
		s = newScrape()
	})
	return Scrape
}

// NewScrape ...
func newScrape() scrape.IScrape {
	if DefaultOption.Proxy != "" {
		scrape.RegisterProxy(DefaultOption.Proxy)
	}

	if DefaultOption.Output != "" {
		scrape.DefaultOutputPath = DefaultOption.Output
	}

	Scrape = scrape.NewScrape(
		scrape.GrabOption(scrape.NewGrabJavbus()),
		scrape.GrabOption(scrape.NewGrabJavdb()),
		scrape.OptimizeOption(DefaultOption.Optimize),
		scrape.ExactOption(DefaultOption.Exact),
	)
	return Scrape
}

// RenewScrape ...
func RenewScrape() scrape.IScrape {
	return newScrape()
}

// FindContent ...
func FindContent(no string) (*VideoContent, error) {
	path := filepath.Join("data", "info")
	DefaultOption.Output = path
	s := NewScrape()
	if err := s.Find(no); err != nil {
		return nil, err
	}
	if err := s.Output(); err != nil {
		return nil, err
	}
	return LoadContent(filepath.Join(path, no, ".info"))
}
