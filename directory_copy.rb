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
#method for getting list of names/cohort etc from the user input into array
def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.delete("\n").capitalize
  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter country of birth"
    birth = gets.chomp
    puts "Please enter the hobby"
    hobby = gets.chomp
    puts "Please enter the cohort"
    cohort = gets.chomp.capitalize 
    #sets default month as a november if the user made no input
    if cohort.empty?
      cohort = "November" 
    #if not empty its gonna ask user to correct their spelling until it equals any string from our spelling method
    else
      until spelling(cohort) == true
        puts "Please make sure you have a correct spelling for the cohort!"
        cohort = gets.chomp.capitalize
      end
    end  
    #add the student hash to the array
    students << {name: name, cohort: cohort, birth: birth, hobby: hobby}
    #prints appropriative message for the student count
    if students.count == 1
      puts "Now we have #{students.count} student. Enter the next student or hit return to exit."
    else
      puts "Now we have #{students.count} students. Enter the next student or hit return to exit."
    end  
    #get another name from the user
    name = gets.chomp.capitalize
  end
  #return the array of students
  students
end
#method for printing the header
def print_header
  puts "The students of Villains Academy".center(85)
  puts "-" * 100
end
#method for printing each student name from the array
def print(names)
  names.each.with_index(1) do |name, index|
    #if name[:name].start_with?("K") checks if string start with specific character, k in this case
    #if name[:name].length < 12 checks length
      puts "#{index}.#{name[:name].center(16)}| cohort: #{name[:cohort].center(10)}| Country of birth: #{name[:birth].center(15)}| hobby: #{name[:hobby].center(15)}"
    #end
  end

  #the next part of code is the same as each loop but made with until, 
  #method print_footer should be deleted if using until.
  #this block of code basically will print out our student info until the array will be empty, 
  #names.pop is what takes it from the array and returns to us
  
  #until names.empty?
    #name = names.pop
    #puts "#{name[:name]} #{name[:cohort]} cohort"
  #end
  #puts "Overall, we have #{name.count} great students"
end
#method for printing total number of students
def print_footer(names)
  puts "-" * 100
  puts "Overall, we have #{names.count} great students".center(85)
end
#method to sort and print our students by the cohorts
def cohort_group(names)
  #creating new hash for groups
  cohort_hash = {}
  puts "Cohort groups"
  names.each do |student|
    #assigning key value pairs for the new hash
    cohort = student[:cohort]
    name = student[:name]
    #if key(cohort) is empty pushes new names in 
    if cohort_hash[cohort] == nil
      cohort_hash[cohort] = [name]
    else
      cohort_hash[cohort].push(name)
    end
  end
  #prints the results, key is cohort, value are names
  cohort_hash.each do |key, value|
    puts "-" * 50
    puts "Cohort: #{key}"
    puts value
  end
end

#assigned variable to our input method
students = input_students
#nothing happens until we call the methods
if students.empty?
  puts "No students found"
else
  print_header
  print(students)
  print_footer(students)
  cohort_group(students)
end