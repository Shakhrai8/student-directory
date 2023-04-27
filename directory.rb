#let's pull all students into an array
students = [
  "Dr.Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
#method for printing the header
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end
#method for printing each student name from the array
def print(names)
  names.each do |name|
    puts name
  end
end
#method for printing total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call the methods
print_header
print(students)
print_footer(students)