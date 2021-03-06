@students = []

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

  name = STDIN.gets.chomp

  while !name.empty? do
    @students << {name: name, cohort: :march}
    puts "Now we have #{@students.count} students."
    name = STDIN.gets.chomp
  end
end

def print_menu
  puts "1. Input the students."
  puts "2. Show the students."
  puts "3. Save the students list to file."
  puts "4. Load list of students from file."
  puts "9. Exit."
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
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "That option doesn't exist. Try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end

  file.close
end

def load_students(file_name = "students.csv")
  file = File.open(file_name, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  file_name = ARGV.first
  return if file_name.nil?
  if File.exists?(file_name)
    load_students(file_name)
    puts "Loaded #{@students.count} studends from #{file_name}"
  else
    puts "Sorry, the file #{file_name} doesn't exists"
    exit
  end
end

try_load_students
interactive_menu
