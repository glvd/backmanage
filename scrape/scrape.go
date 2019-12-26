package scrape

import (
	"github.com/glvd/backmanage/data"
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
		Output:   filepath.Join("data", "info"),
	}
}

// NewScrape ...
func NewScrape() scrape.IScrape {
	once.Do(func() {
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
	})
	return Scrape
}

// FindContent ...
func FindContent(no string) (*data.Content, error) {
	path := filepath.Join("data", "info")
	DefaultOption.Output = path
	s := NewScrape()
	if err := s.Find(no); err != nil {
		return nil, err
	}
	if err := s.Output(); err != nil {
		return nil, err
	}
	return data.LoadContent(filepath.Join(path, no, ".info"))
}
