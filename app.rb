require 'bundler'
Bundler.require

require 'json'
require 'cfpropertylist'
require './lib/powder'

module AssetHelpers
  def asset_path(source)
    "/assets/" + settings.sprockets.find_asset(source).digest_path
  end
end


class App < Sinatra::Base
  set :root, File.expand_path('../', __FILE__)
  set :sprockets, Sprockets::Environment.new(root)
  set :precompile, [ /\w+\.(?!js|css).+/, /application.(css|js)$/ ]
  set :assets_prefix, 'assets'
  set :assets_path, File.join(root, 'public', assets_prefix)

  configure do
    sprockets.append_path(File.join(root, 'assets', 'stylesheets'))
    sprockets.append_path(File.join(root, 'assets', 'javascripts'))
    sprockets.append_path(File.join(root, 'assets', 'images'))
    sprockets.context_class.instance_eval do
      include AssetHelpers
    end
  end

  helpers do
    include AssetHelpers
  end

  ["/", "/resorts/?", "/settings/?"].each do |path|
    get path do
      @states	= Powder.states.to_json
      @resorts = Powder.resorts.to_json
      erb :index
    end
  end
  
  get '/api/json' do 
    Powder.resorts.to_json
  end
  
  get '/api/plist' do    
    Powder.resorts.to_plist
  end
  
end

