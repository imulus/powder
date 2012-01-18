require './lib/powder'
require './lib/ski_report'

desc "Update the resorts data in the Redis cache from the feed"
task :update_resorts_cache do
  puts "Updating resorts cache..."

  resorts = []
  
  Powder::STATES.each do |state|
    SkiReport.fetch(state).each { |resort| resorts.push resort }
  end

  resorts.sort! {|x,y| x[:name].strip.downcase <=> y[:name].strip.downcase }
  Powder::REDIS['resorts'] = resorts
  
  puts "Done."
end
