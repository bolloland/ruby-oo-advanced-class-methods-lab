require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << self.new
    # song = self.new <WOULD
    # song.save       <THIS
    # song            <WORK?
    @@all[-1]
  end

  def self.new_by_name(name)
   song = self.new
   song.name = name
   song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

#sort thru all names in @@all
#find the song title that matches your argument
#return that Song instance
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end #you do too much

     def self.find_or_create_by_name(name)
        if self.find_by_name(name)
          self.find_by_name(name)
        else 
          self.create_by_name(name) 
        end
      end

      def self.alphabetical
        self.all.sort_by {|song_name| song_name.name}
      end

      def self.new_from_filename(file)
        song = self.new
        info = file.delete_suffix!(".mp3").split(" - ")
        #cut off the -mp3
        # info = song.name.split(" - ")#.split at (" - ")
        #info = that new array
        song.artist_name = info[0]
        song.name = info[1]
        # song.artist_name = artist_name
        # song.name = song_name
        song.save
        song
        #binding.pry
      end

    def self.create_from_filename(file)
      self.new_from_filename(file)
    end

    def self.destroy_all
      self.all.clear
    end
end
