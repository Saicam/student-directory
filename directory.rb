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
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

print_header
print_names(students)
print_footer(students)
