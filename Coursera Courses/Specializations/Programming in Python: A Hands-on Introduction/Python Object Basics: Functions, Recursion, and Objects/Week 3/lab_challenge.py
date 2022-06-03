#Use the class below to solve the lab challenge
import copy

class Dog:
  def __init__(self, name, breed):
    self.name = name
    self.breed = breed
    
#Start your program below this line

dog1 = Dog('Marceline', 'German Shepherd')
dog2 = copy.deepcopy(dog1)
dog2.name = 'Cajun'
dog2.breed = 'Belgian Malinois'
