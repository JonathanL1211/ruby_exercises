module Crud
#to import the module to other files:
#same directory: require_relative 'crud'
#can use the module through require 'crud' -> This wouldnt work if its in the same directory
#in that case, put this before require 'crud' => $LOAD_PATH << "."
#in the file that is requiring the module, call Crud.(methods from the module)
#in the file that is the module (in this case, bcrypt.rb),when loading the method, you should do this for ALL methods -> def Crud.create_new_hash ...
# or -> def self.create_new_hash ...
  require 'bcrypt'
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
  # my_password = BCrypt::Password.create('my password')
  #=> "$2a$12$K0ByB.6YI2/OYrB4fQOYLe6Tv0datUVf6VZ/2Jzwm879BW5K1cHey"
  # puts my_password

  # my_password = BCrypt::Password.new('$2a$10$utLMCdlQlWQtBUwWiTLcKu0W1HPppBnIMyMQjGNUlDsdqnWyvxzl.')
  # puts my_password == 'my password'

  def create_new_hash(password)
    BCrypt::Password.create(password)
  end

  def verify_hash(password)
    BCrypt::Password.new(password)
  end

  # new_password = create_new_hash('Something')
  # puts new_password
  # puts new_password == 'Something' #-> true
  # puts new_password == 'something' #-> false
  # puts verify_hash('$2a$10$3HR5btzacqMQZdbhNg25XeUgHMEktUy0W.LOvIljZ3oknAEv6KIxS') == 'Something'

  def create_secure_users(list_of_user)
    list_of_user.each do |user|
      user[:password] = create_new_hash(user[:password])
    end
    list_of_user
  end

  puts create_secure_users(users)

  def authenticate_user(username, password, list_of_user)
    list_of_user.each do |user|
      if user[:username] == username && verify_hash(user[:password]) == password
        return user
      end
    end
    "Credentials are not correct!"
  end

  puts authenticate_user("Jonathan", 123456, users)
end

