require 'i18n'
require 'active_support'
require 'active_support/core_ext/hash'
require 'open-uri'
require 'digest/md5'

module SkiReport
	
	def self.fetch(state)
		state = state.downcase.gsub(/[ ]/,'-')
		url = "http://www.onthesnow.com/#{state}/snow.rss"
		puts "Fetching #{url}"
		src = ""; file = open(url) { |f| f.each_line { |line| src += line.gsub(/ots:/, '') }}
		report = Hash.from_xml src
		items = report['rss']['channel']['item']
		
		if items.class == Hash
			resorts = SkiReport::transform items, state
		elsif items.class == Array
			resorts = items.collect { |item| SkiReport::transform item, state }			
		else
			raise "Could not parse response format"
		end
	end
	

	def self.transform(item, state)
		{	:state			=> { :name => state, 
											 :filter_key => state.downcase.gsub(/[ ]/,'-') },
			:id					=> Digest::MD5.hexdigest(item['guid'].strip.downcase),
			:name 			=> item['title'],
			:updated 		=> item['pubDate'],
			:status 		=> item['open_staus'],
			:conditions => item['surface_condition'],
			:base				=> { 	:depth => item['base_depth'], 
												:metric => item['base_depth_metric'],
												:metric_shorthand => item['base_depth_metric'] == 'feet' ? "'" : '"'  },
			:snowfall 	=> {  :amount => item['snowfall_48hr'], 
												:metric => item['snowfall_48hr_metric'],
												:metric_shorthand => item['snowfall_48hr_metric'] == 'feet' ? "'" : '"'  } }		
	end

end
