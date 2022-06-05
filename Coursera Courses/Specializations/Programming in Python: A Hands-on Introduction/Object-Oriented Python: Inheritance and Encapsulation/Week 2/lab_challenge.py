class Person:
  def __init__(self, name, age, occupation):
    self._name = name
    self._age = age
    self._occupation = occupation
    
  def get_name(self):
    return self._name
  
  def set_name(self, new_name):
    self._name = new_name
    
  def get_age(self):
    return self._age
  
  def set_age(self, new_age):
    self._age = new_age
    
  def get_occupation(self):
    return self._occupation
  
  def set_occupation(self, new_occupation):
    self._occupation = new_occupation
