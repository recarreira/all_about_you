## Initial Setup

	git clone git://github.com/recarreira/all_about_you.git my_awesome_page
	cd my_awesome_page
	bundle install

## Github Page Config

	rake setup_github_pages

## Put your data

Edit _config.yml

## Generate a preview page

	jekyll build --watch
	jekyll serve
	open http://localhost:4000

## Deploy your page

	rake deploy
	
## Page example

[Mr Awesome's Profile](http://renatacarreira.com/all_about_you/)

