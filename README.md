example-ember-with-middleman, Write Ember.js App With Middleman
=================================================================

This is part of [Write Ember.js App With Middleman Tutorial](https://gist.github.com/4364010). Check out [Live Demo](http://gutenye.github.com/example-ember-with-middleman)

* Use `bower` to manage brower packages.
* Use `sprockets` to manage javascript assets. 
* Use `sass` to manage css assets.
* Use `sprockets-handlebars_template` to compile handlebars.

**Source Code Layout**

	source/
		index.html
		stylesheets/
		images/
		app/
			main.js
			routes.js
			controllers/  foo_controller.js
			views/        foo_view.js
			templates/    foo.handlebars
			models/       foo.js
	vendor/
		javascripts/
		stylesheets/

**Development**

	$ bundle install
	$ bower install
	$ rake server
	
**Build The Site**

	$ rake build

**Deploy To Github Pages**

	$ rake deploy

**Resources**

* [ember.js](http://www.emberjs.com/): A JavaScript framework for creating ambitious web applications 
* [bower](http://twitter.github.com/bower/): A package manager for the web  
* [middleman](http://middlemanapp.com/): Hand-crafted frontend development 
* [sprockets-handlebars_template](https://github.com/GutenYe/sprockets-handlebars_template): a handlebars template for sprockets 
* [middleman-ember-template](https://github.com/GutenYe/middleman-ember-template): A middleman template for developping ember.js app

**Copyright**

(the MIT License)

Copyright (c) 2012 Guten

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
