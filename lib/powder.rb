require 'redis'
require 'open-uri'

module Powder

  STATES = [	'Alaska', 'Arizona', 'California', 'Colorado', 'Connecticut', 'Idaho',
              'Illinois', 'Indiana', 'Iowa', 'Maine', 'Massachusetts', 'Michigan', 'Minnesota',
              'MissoURI', 'Montana', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico',
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
    eval(REDIS['resorts'])
  end
  
end
