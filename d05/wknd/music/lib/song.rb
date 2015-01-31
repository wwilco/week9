require 'active_record'

class Songs < ActiveRecord::Base
  def methsong
    Albums.find_by({id: self.album_id})
  end
end
