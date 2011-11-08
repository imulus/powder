# Internal Apps

## Applications

- **Dashboard** [/dashboard](http://imulus-dashboard.com/dashboard): An API-hungry data display board

- **Cluster**: A suite of internal apps for Imulus (clients, imulites, projects)

## Local Installation

1. Clone

        $ git clone git@github.com:imulus/internal-apps.git
        $ cd internal-apps

2. Install Dependencies

        $ bundle
  
3. Boot the server

        $ rackup
        
4. Yahtzee -> http://localhost:9292/dashboard

## Deployment

1. Install Heroku gem

        $ gem install heroku

2. Add Heroku Remote
        
        $ git remote add heroku git@heroku.com:imulus-dashboard.git 

3. Push It Real Good

        $ git push heroku master
        
4. Pay Dirt -> http://imulus-dashboard.com/dashboard

        
## Structure 

The [internal-apps](https://github.com/imulus/internal-apps) repository contains multiple Rack applications all mounted to the same Rack instance. All applications are booted when the server is booted. 

Each application exists in parallel isolated in its own directory, complete with assets.

        /internal-apps root
        ├── app-one
        ├── app-two
        ├── app-three
        ├── Gemfile
        ├── Gemfile.lock
        ├── README.md
        └── config.ru


## The Rules

1. Always work on the `develop` branch or a topic/feature branch derived from `develop`.
2. Merge topic branches down into `develop` before merging into `master`
3. `master` is always deployable. Be sure to review your code before merging into `master`.
4. When you push `master` to GitHub, also push it to Heroku.
5. Don't talk about Fight Club.