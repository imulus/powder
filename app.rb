require 'bundler'
Bundler.require

require 'json'
require './lib/ski_report'

module Powder


	STATES = [	'Alaska', 'Arizona', 'California', 'Colorado', 'Connecticut', 'Idaho', 
							'Illinois', 'Indiana', 'Iowa', 'Maine', 'Massachusetts', 'Michigan', 
							'Minnesota', 'Missouri', 'Montana', 'Nevada', 'New Hampshire', 'New Jersey', 
							'New Mexico', 'New York', 'North Carolina', 'Ohio', 'Oregon', 'Pennsylvania', 'South Dakota',
							'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming' ]

  module AssetHelpers
    def asset_path(source)
      "/assets/" + settings.sprockets.find_asset(source).digest_path
    end
  end



	class Cache
	  @@items = {}

	  def self.fetch(key)
	    if @@items.has_key?(key) and Time.now < @@items[key][:expires]
	      @@items[key][:data]
	    else
	      false
	    end
	  end


	  def self.stash(key, data)
			@@items[key] =  { 	:data => data,
	                     	:expires => Time.now + 600 }
			return data
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
		
		def states
			STATES.collect { |state| { :name => state, :filter_key => state.downcase.gsub(/[ ]/,'-') }}
		end

		def resorts
			if Cache.fetch('resorts')
				Cache.fetch('resorts').to_json
			else
				resorts = []

				STATES.each do |state|
					SkiReport.fetch(state).each { |resort| resorts.push resort }
				end
							
				resorts.sort! {|x,y| x[:name].strip.downcase <=> y[:name].strip.downcase } 								
				Cache.stash('resorts', resorts)
		   	resorts.to_json
			end
		end
		
		
		def resorts_by_state(state)
			if Cache.fetch(state)
				Cache.fetch(state).to_json
			else
				resorts = SkiReport.fetch(state)
				resorts.sort! {|x,y| x[:name].strip.downcase <=> y[:name].strip.downcase } 
				Cache.stash(state, resorts)
		   	resorts.to_json
			end			
		end


		["/", "/resorts/?", "/settings/?"].each do |path|
		  get path do
				@states	= states.to_json
				@resorts = resorts
	      erb :index
		  end
		end

		

		get "/resorts.json" do
			content_type :json
			resorts
		end

		get "/states.json" do
			content_type :json
			states.to_json
		end
		
		get "/states/:state/resorts.json" do
			content_type :json
			resorts_by_state(params[:state])
		end
		
		
			


  end
end
