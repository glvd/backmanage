package scrape

import (
	scrape "github.com/javscrape/go-scrape"
)

// Option ...
type Option struct {
	Proxy       string
	GrabOptions []scrape.Options
	Optimize    bool
	Exact       bool
}

// DefaultOption ...
func DefaultOption() Option {
	return Option{
		Proxy: "",
		//GrabOptions: []scrape.Options{scrape.GrabOption(scrape.NewGrabJavbus()), scrape.GrabOption(scrape.NewGrabJavdb())},
		Optimize: true,
		Exact:    true,
	}
}

// NewScrape ...
func NewScrape(option Option) scrape.IScrape {
	return scrape.NewScrape(scrape.OptimizeOption(option.Optimize), scrape.ExactOption(option.Exact))
}
