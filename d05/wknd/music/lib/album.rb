require 'active_record'

class Albums < ActiveRecord::Base
  def methalbum
    Artists.find_by({id: self.artist_id})
  end
end

# dinkalage.house will get you the house of dinklage
