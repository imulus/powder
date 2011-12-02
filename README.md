# Powder | A Backbone-powered iPad webapp
**Track snow conditions at your favorite ski resorts**

Powder is an experiment using [http://documentcloud.github.com/backbone/](backbone.js) to power an iPad webapp. On the client, Powder uses the browser's native HTML5 localStorage mechanism to save the users's preferences, the list of resorts the user chooses to track. On the server, Powder uses Sinatra to fetch and parse various snow/ski reports from [http://onthesnow.com/](http://onthesnow.com/) then serve it up as JSON to the browser.

### The Stack

- [https://github.com/sinatra/sinatra](Sinatra) for feed parsing
- [https://github.com/sstephenson/sprockets](Sprockets) for asset packaging
- [https://github.com/jashkenas/coffee-script/](CoffeeScript) because it's better than JavaScript
- [https://github.com/nex3/sass](SCSS) because it's better than CSS
- [https://github.com/documentcloud/backbone](Backbone) for client-side structure
- [https://github.com/sstephenson/eco](Eco) for Backbone templating
- [http://dev.w3.org/html5/webstorage/](localStorage) for client-side persistence


## Installation

1. Clone

        $ git clone git@github.com:imulus/powder.git && cd powder
        
2. Install Dependencies

        $ bundle install
  
3. Fire it up

        $ rackup



## Credit

Powder gets all resort data from the [http://onthesnow.com/](http://onthesnow.com/) RSS feed. Many thanks.


## License

Copyright (C) 2011 by Imulus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.