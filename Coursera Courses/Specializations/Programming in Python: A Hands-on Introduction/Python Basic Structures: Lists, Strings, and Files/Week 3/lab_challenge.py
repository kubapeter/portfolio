text = []
with open("student_folder/.labs/myanmar.txt", "r") as input_file:
    text = input_file.readlines()
for row in text: 
  print(row.replace("Burma", "Myanmar"), end="")
