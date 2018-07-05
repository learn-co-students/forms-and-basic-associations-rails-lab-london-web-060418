class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
      self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
      return self.artist ? self.artist.name : nil
  end

  def genre_name=(genre_name)
      return self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def genre_name
      return self.genre ? self.genre.name : nil
  end

  def note_contents=(notes_arr) #array
      if(notes_arr.length > 0)
          notes_arr.each do |note_str|
              if(note_str != "")
                  note = Note.create(content: note_str)
                  self.notes << note
              end
          end
      end
  end

  def note_contents
      return self.notes.map {|note| note.content}
  end
end
