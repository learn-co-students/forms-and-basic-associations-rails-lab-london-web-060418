class Artist < ActiveRecord::Base
  has_many :songs

  def song_ids=(ids)
     ids.each do |id|
       post = Song.find(id)
       self.songs << song
     end
   end
end
