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
#final method for our interactive menu which will call other methods 
def interactive_menu
  #Declared variable student again so it will be available in several iterations of the loop
  students = []
  loop do
    # print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #read the input and save it into a variable
    selection = gets.chomp
    #do what the has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end
#nothing gonna happen until we call our method for the menu
interactive_menu