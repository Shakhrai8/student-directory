#create an empty array
@students = []
#method for checking if spelling of the month was correct
def spelling(month)
  #making an array for the months
  month_array =[ 
    "January", 
    "February", 
    "March", 
    "April", 
    "May", 
    "June", 
    "July", 
    "August", 
    "September", 
    "October", 
    "November", 
    "December"
  ]
  #checking if the array includes our user unput, if yes returns true
  month_array.include?(month)
end

#method for getting list of names from the user input into array
def input_students
  puts "Please enter the names of the students".center(85)
  puts "To finish, just hit return twice".center(85)
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter the cohort".center(85)
    cohort = STDIN.gets.chomp.capitalize 
    #sets default month as a november if the user made no input
    if cohort.empty?
      cohort = "November" 
    #if not empty its gonna ask user to correct their spelling until it equals any string from our spelling method
    else
      until spelling(cohort) == true
        puts "Please make sure you have a correct spelling for the cohort!".center(85)
        cohort = STDIN.gets.chomp.capitalize
      end
    end  
    #add the student hash to the array
    add_students(name, cohort)
    #prints appropriative message for the student count
    if @students.count == 1
      puts "Now we have #{@students.count} student. Enter the next student or hit return to exit.".center(85)
    else
      puts "Now we have #{@students.count} students. Enter the next student or hit return to exit.".center(85)
    end  
    #get another name from the user
    name = STDIN.gets.chomp.capitalize
  end
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort}
end

#method for printing the header
def print_header
  puts "The students of Villains Academy".center(85)
  puts "-" * 100
end

#method for printing each student name from the array
def print_students_list
  @students.each.with_index(1) do |name, index|
    puts "#{index}.#{name[:name].center(16)}| cohort: #{name[:cohort].center(10)}"
  end
end

#method for printing total number of students
def print_footer
  puts "-" * 100
  puts "Overall, we have #{@students.count} great students".center(85)
  puts " "
end

#method for printing the menu options
def print_menu
  puts "----------------------------------------".center(85)
  puts "1. Input the students".center(65)
  puts "2. Show the students".center(65)
  puts "3. Save the list to students.csv".center(76)
  puts "4. Load the list from students.csv".center(78)
  puts "9. Exit".center(52)
  puts "----------------------------------------".center(85)
end

#method for printing student list
def show_students
  print_header
  print_students_list
  print_footer
end

#method for saving student data
def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

#method for loading files
def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  file.close
end

#method for loading the program with argument
def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exist?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}".center(85)
  else #if it doesnt exist
    puts "Sorry, #{filename} doesn't exist.".center(85)
    exit #quit the program
  end
end

#method for selection
def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      puts "You have chosen to view the list of students.".center(85)
      puts " "
      show_students
    when "3"
      puts "File is saved successfully!".center(85)
      puts " "
      save_students
    when "4"
      puts "File is loaded successfully!".center(85)
      puts " "
      load_students
    when "9"
      puts "Exiting the program...".center(85)
      puts " "
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant, try again".center(85)
  end
end

#final method for our interactive menu which will call other methods 
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end  
end

#nothing gonna happen until we call our method for the menu
try_load_students
interactive_menu