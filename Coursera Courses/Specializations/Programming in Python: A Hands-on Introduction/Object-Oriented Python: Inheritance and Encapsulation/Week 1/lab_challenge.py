# parent class
class MP3:
  def __init__(self, artist, title, album, length, genre):
    self.artist = artist
    self.title = title
    self.album = album
    self.length = length
    self.genre = genre
    
  def get_artist(self):
    return f"The artist is {self.artist}"
    
  def get_title(self):
    return f"The title is {self.title}"
    
  def get_album(self):
    return f"The album is {self.album}"
    
  def get_length(self):
    return f"The length is {self.length}"
    
  def get_genre(self):
    return f"The genre is {self.genre}"
    
class Podcast(MP3):
  def __init__(self, name, title, length, genre, date): 
    self.name = name
    self.title = title
    self.length = length
    self.genre = genre
    self.date = date
    
  def get_name(self):
    return f"The name is {self.name}"
  
  def get_length(self):
    return f"The length is {self.length//60} minutes and {self.length%60} seconds"
  
  def get_date(self):
    return f"The date is {self.date}"
    
p = Podcast("Planet Money", "Hollywood's Black List", 1460, "economics", "10 July 2020")

print(p.get_name())
print(p.get_title())
print(p.get_length())
print(p.get_genre())
print(p.get_date())
