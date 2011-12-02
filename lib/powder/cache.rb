module Powder

  class Cache
    @@items = {}
    @@period = 10800

    def self.fetch(key)
      if @@items.has_key?(key) and Time.now < @@items[key][:expires]
        @@items[key][:data]
      else
        false
      end
    end

    def self.stash(key, data)
      @@items[key] =  { :data => data, :expires => Time.now + @@period }
      return data
    end
  end
  
end  