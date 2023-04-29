#create an empty array
@students = []
#method for getting list of names from the user input into array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = gets.chomp
  end
end
#method for printing the header
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end
#method for printing each student name from the array
def print_students_list
  @students.each.with_index(1) do |name, index|
    puts "#{index}.#{name[:name]} (#{name[:cohort]} cohort)"
  end
end
#method for printing total number of students
def print_footer
  puts "Overall, we have #{@students.count} great students"
end
#method for printing the menu options
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end
#method for printing student list
def show_students
  print_header
  print_students_list
  print_footer
end
#method for selection
def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end
#final method for our interactive menu which will call other methods 
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end  
end
#nothing gonna happen until we call our method for the menu
interactive_menu