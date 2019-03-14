students = [
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

def print_names(students)
  students.each_with_index { |student, index| puts "#{index +1}: #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :march}
    puts "Now we have #{students.count} students."
    name = gets.chomp
  end

  students

end

def interactive_menu
  students = []

  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"

    selection = gets.chomp

    case selection
    when "1"
      students += input_students
    when "2"
      print_header
      print_names(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "That option doesn't exist. Try again."
    end

  end

end

interactive_menu
