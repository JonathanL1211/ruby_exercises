users = [
  {username: "Jonathan", password: "123456", location: "havelock road", school: "GA" },
  {username: "Anne", password: "654321", location: "purmei road", school: "Smart Local" },
  {username: "Gid", password: "111111", location: "panjang road", school: "Church of Christ" },
  {username: "Timo", password: "123123", location: "compasss road", school: "Info tech" },
  {username: "Ben", password: "123444", location: "bedok road", school: "Student" },
  {username: "NJ", password: "222222", location: "bishan road", school: "CyberSecurity" },
  {username: "Lee", password: "132212", location: "bukit timah road", school: "parliament" },
  {username: "Handy", password: "145145", location: "sungei road", school: "Sign on regular officer" },
  {username: "Akira", password: "555555", location: "orchard road", school: "GA instructor" },
  {username: "Rachel", password: "654322", location: "kallang road", school: "Interior Designer" },
  {username: "Hosy", password: "662352", location: "panjang road", school: "Professor at NTU" },
  {username: "Cheng", password: "112233", location: "changi airport road", school: "Cleaner" }
]

def auth_user(username, password, list_of_users)
  list_of_users.each do |user|
    if user[:username] == username && user[:password] == password
      return user
    end
  end
  return "Credential is not correct"
end

puts "Welcome to the authenticator!"
25.times {print "-"}
puts
puts "The program will take input from the user and compare password"
puts "If password is correct, you will get back the details of the user"

attempts = 1
while attempts < 4
  print "Username: "
  #strip to remove white spaces
  username = gets.chomp.strip
  print "Password: "
  password = gets.chomp.strip
  #comparing the users
  authentication = auth_user(username, password, users)
  puts authentication
  puts "Press n to quit or other keys to continue"
  input = gets.chomp.downcase
  break if input == "n"
  attempts += 1
end
puts "You have exceeded the number of attempts" if attempts == 4
