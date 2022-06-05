class Chef:
  def __init__(self, name, cuisine, stars):
    self.name = name
    self.cuisine = cuisine
    self.michelin_stars = stars
    
  def __gt__(self, other_chef):
    return self.michelin_stars > other_chef.michelin_stars
    
  def compare(self, other_chef):
    if self > other_chef:
      return f'{self.name} has more Michelin stars than {other_chef.name}'
    else:
      return f'{other_chef.name} has more Michelin stars than {self.name}'
