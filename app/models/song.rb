class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # def initialize(hash)
  #   hash.each do |key, value|
  #     self.send("#{key}=", value)
  #   end
  # end

  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end

   def artist_name
      self.artist ? self.artist.name : nil
   end

   def genre_name=(name)
      self.genre = Genre.find_or_create_by(name: name)
    end

    def genre_name
       self.genre ? self.genre.name : nil
    end

    def note_contents=(contents)
       contents.each_with_index do |contents, index|
         note = Note.new(:content => contents, song: self)
         if note.content.length > 0
           self.notes << note
         end
       end
     end

     def note_ids=(ids)
        ids.each do |id|
          note = Note.find(id)
          self.notes << note
        end
      end

    def note_contents
      self.notes.map do |note|
        note.content
      end
    end

end
