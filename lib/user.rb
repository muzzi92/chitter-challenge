require 'bcrypt'

class User

  attr_reader :id, :name, :username, :email

  def initialize(id, name, username, email, password)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.all
    result = choose_database.exec("SELECT * FROM users;")
    result.map { |user| User.new(user['id'], user['name'], user['username'], user['email'], user['password']) }
  end

  def self.create(name, username, email, password)
    passkey = BCrypt::Password.create(password)
    user = choose_database.exec("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{passkey}') RETURNING *;")
    User.new(user[0]['id'], user[0]['name'], user[0]['username'], user[0]['email'], user[0]['password'])
  end

  def self.find(id)
    return nil unless id
    result = choose_database.exec("SELECT * FROM users WHERE id=#{id};")
    User.new(result[0]['id'], result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  private

  def self.choose_database
    ENV['ENVIRONMENT'] == 'test' ? PG.connect(dbname:'chitter_app_test') : PG.connect(dbname:'chitter_app')
  end

end
