require 'active_record'

class Artists < ActiveRecord::Base
  def methartist
    Albums.where({artist_id: self.id})
  end
end
