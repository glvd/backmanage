package captcha

// Captcha ...
type Captcha interface {
	Validate(token string) bool
}

// List ...
var List = make(map[string]Captcha)

// Add ...
func Add(key string, captcha Captcha) {
	List[key] = captcha
}

// Get ...
func Get(key string) (Captcha, bool) {
	captcha, ok := List[key]
	return captcha, ok
}
