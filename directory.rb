students = [
  "Akuba",
  "Philip Board",
  "Josh",
  "Sol",
  "Sean",
  "Deanna",
  "Jose"
]

def print_header
  puts "Students of the Academty"
  puts "-------"
end

def print_names(names)
  names.each { |name| puts name }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

print_header
print_names(students)
print_footer(students)
