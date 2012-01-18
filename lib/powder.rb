require 'redis'
require './lib/ski_report'
require './lib/powder/cache'



module Powder

  STATES = [	'Alaska', 'Arizona', 'California', 'Colorado', 'Connecticut', 'Idaho',
              'Illinois', 'Indiana', 'Iowa', 'Maine', 'Massachusetts', 'Michigan', 'Minnesota', 
              'Missouri', 'Montana', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 
              'New York', 'North Carolina', 'Ohio', 'Oregon', 'Pennsylvania', 'South Dakota', 'Utah', 
              'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming' ]

  uri = URI.parse(ENV["REDISTOGO_URL"])
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

  def self.states
		STATES.collect do |state| 
			{ :name => state, 
				:filter_key => state.downcase.gsub(/[ ]/,'-') }
		end
  end
  

  def self.resorts
    if REDIS['resorts']
      REDIS['resorts']
    else
      resorts = []

      STATES.each do |state|
        SkiReport.fetch(state).each { |resort| resorts.push resort }
      end

      resorts.sort! {|x,y| x[:name].strip.downcase <=> y[:name].strip.downcase }
      REDIS['resorts'] = resorts
     	return resorts
    end
  end

end