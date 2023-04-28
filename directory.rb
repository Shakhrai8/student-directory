#method for getting list of names from the user input into array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end
#method for printing the header
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end
#method for printing each student name from the array
def print(names)
  names.each.with_index(1) do |name, index|
    puts "#{index}.#{name[:name]} (#{name[:cohort]} cohort)"
  end
end
#method for printing total number of students
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#assigned variable to our input method
students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)