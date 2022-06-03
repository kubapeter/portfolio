class Zoo:
  def __init__(self, big_cats, primates, reptiles, birds):
    self.big_cats = big_cats
    self.primates = primates
    self.reptiles = reptiles
    self.birds = birds
    
  def total_animals(self):
    return self.big_cats + self.primates + self.reptiles + self.birds
  
  def total_mammals(self):
    return self.big_cats + self.primates
  
  def most_animals(self): 
    max = 0
    maxname = ""
    for anim in [self.big_cats, self.primates, self.reptiles, self.birds]:
      if anim > max:
        max = anim
        maxname  = namestr(anim)
    return maxname

def namestr(obj, namespace):
    return [name for name in namespace if namespace[name] is obj]
  
  
my_zoo = Zoo(10, 30, 90, 120)
print(my_zoo.total_animals())
print(my_zoo.total_mammals())
print(my_zoo.most_animals())
