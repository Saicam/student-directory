@students = [
  {name: "Akuba", cohort: :march},
  {name: "Philip Board", cohort: :march},
  {name: "Josh", cohort: :march},
  {name: "Sol", cohort: :march},
  {name: "Sean", cohort: :march},
  {name: "Deanna", cohort: :march},
  {name: "Jose", cohort: :march}
]

def print_header
  puts "Students of the Academty"
  puts "-------"
end

def print_students_list
  @students.each_with_index { |student, index| puts "#{index +1}: #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer
  puts "Overall, we have #{@students.count} great students."
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = gets.chomp

  while !name.empty? do
    @students << {name: name, cohort: :march}
    puts "Now we have #{@students.count} students."
    name = gets.chomp
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "That option doesn't exist. Try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end


interactive_menu
