@PHONY: all
all: clean public/index.html public/style.css

@PHONY: clean
clean:
	rm -rf public/index.html public/style.css

public/index.html: index.md template.html
	./build.sh
	
public/style.css: style.scss
	npx sass style.scss:public/style.css
