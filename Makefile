@PHONY: all
all: clean public/index.html public/style.css

@PHONY: clean
clean:
	rm -rf public/index.html public/style.css

public/index.html: index.md template/header.html template/footer.html
	cat template/header.html > public/index.html
	DATE=$(shell date +%Y-%m-%d) envsubst < index.md | npx marked --gif >> public/index.html
	cat template/footer.html >> public/index.html
	
public/style.css: style.scss
	npx sass style.scss:public/style.css
