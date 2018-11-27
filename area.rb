dial_book = {
  "newyork" => "212",
  "newbrunswick" => "732",
  "edison" => "908",
  "plainsboro" => "609",
  "sanfrancisco" => "301",
  "miami" => "305",
  "paloalto" => "650",
  "evanston" => "847",
  "orlando" => "407",
  "lancaster" => "717"
}

# Get city names from the hash
def get_city_names(somehash)
# Write code here
  somehash.keys
end

# Get area code based on given hash and key
def get_area_code(somehash, key)
  # Write code here
  somehash[key]
end

# Execution flow
loop do
  # Write your program execution code here
  puts "Do you want to lookup an area code based on a city's name? (Y/N)"
  answer = gets.chomp.downcase
  break if answer != "y"
  puts get_city_names(dial_book)
  puts "Which area code do you want to display?"
  city_name = gets.chomp
  if dial_book.include?(city_name)
    puts "The area code for #{city_name} is #{get_area_code(dial_book, city_name)}"
  else
    puts "You have entered an invalid city name"
  end
end