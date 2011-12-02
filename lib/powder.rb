require './lib/ski_report'
require './lib/powder/cache'

module Powder

  STATES = [	'Alaska', 'Arizona', 'California', 'Colorado', 'Connecticut', 'Idaho',
              'Illinois', 'Indiana', 'Iowa', 'Maine', 'Massachusetts', 'Michigan', 'Minnesota', 
              'Missouri', 'Montana', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 
              'New York', 'North Carolina', 'Ohio', 'Oregon', 'Pennsylvania', 'South Dakota', 'Utah', 
              'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming' ]

  def self.states
		STATES.collect do |state| 
			{ :name => state, 
				:filter_key => state.downcase.gsub(/[ ]/,'-') }
		end
  end
  

  def self.resorts
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

end