require 'csv'

MENU_WIDTH = 50
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
  name = " "
  while !name.empty? do
    puts "Please enter the name of the student, just hit return twice"
    name = STDIN.gets.chomp
    break if name.empty?
    puts "Please enter the student's cohort, to use default cohort hit return"
    cohort = STDIN.gets.chomp
    cohort = "march" if cohort.empty?
    @s2 << [name, cohort.downcase.to_sym]
    puts "Now we have #{@s2.size} students."
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
  File.open("students.csv", "w") { |csv_file|  csv_file.puts @s2.to_csv }
end

def load_students(file_name = "students.csv")
  @s2 = CSV.read(file_name,headers:true)
end

def try_load_students
  file_name = ARGV.first
  return if file_name.nil?
  if File.exists?(file_name)
    load_students(file_name)
    puts "Loaded #{@s2.count} studends from #{file_name}"
  else
    puts "Sorry, the file #{file_name} doesn't exists"
    exit
  end
end

try_load_students
interactive_menu
