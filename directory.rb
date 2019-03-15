require 'csv'

MENU_WIDTH = 50
@students = []
@s2 = CSV::Table.new([])

def print_header
  puts "Students of the Academty"
  puts "-------"
end

def print_students_list
  @s2.each_with_index { |row, index| puts "#{index+1}: #{row["name"]} (#{row["cohort"]} cohort)" }
end

def print_footer
  puts "Overall, we have #{@s2.size} great students."
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = STDIN.gets.chomp

  while !name.empty? do
    @s2 << [name, :march]
    puts "Now we have #{@s2.size} students."
    name = STDIN.gets.chomp
  end
end

def print_menu
  puts "".center(MENU_WIDTH, "*")
  puts "1. Input the students.".center(MENU_WIDTH)
  puts "2. Show the students.".center(MENU_WIDTH)
  puts "3. Save the students list to file.".center(MENU_WIDTH)
  puts "4. Load list of students from file.".center(MENU_WIDTH)
  puts "9. Exit.".center(MENU_WIDTH)
  puts "".center(MENU_WIDTH, "*")
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
=begin
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end

  file.close
=end
  CSV.open("students.csv", "w") do |csv_file|
    csv_file << @students[0].keys
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_file.puts student_data
    end
  end

end

def load_students(file_name = "students.csv")
=begin
  file = File.open(file_name, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
=end
  @s2 = CSV.read(file_name,headers:true)
  CSV.foreach(file_name, headers:true).each do |student|
    puts student.inspect
    @students << {name: student["name"], cohort: student["cohort"].to_sym}
  end

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
