# Powder | A Backbone-powered iPad webapp
**Track snow conditions at your favorite ski resorts**


![Screenshot](https://github.com/imulus/powder/raw/master/assets/images/powder-ipad.png)


Powder is an experiment using [backbone.js](http://documentcloud.github.com/backbone/) to power an iPad webapp. On the client, Powder uses the browser's native HTML5 localStorage mechanism to save the users's preferences, the list of resorts the user chooses to track. On the server, Powder uses Sinatra to fetch and parse various snow/ski reports from [http://onthesnow.com/](http://onthesnow.com/) then serve it up as JSON to the browser.




### The Stack

- [Sinatra](https://github.com/sinatra/sinatra) for feed parsing
- [Sprockets](https://github.com/sstephenson/sprockets) for asset packaging
- [CoffeeScript](https://github.com/jashkenas/coffee-script/) because it's better than JavaScript
- [SCSS](https://github.com/nex3/sass) because it's better than CSS
- [Backbone](https://github.com/documentcloud/backbone) for client-side structure
- [Eco](https://github.com/sstephenson/eco) for Backbone templating
- [Redis](http://redis.io) for server-side caching
- [localStorage](http://dev.w3.org/html5/webstorage/) for client-side persistence




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