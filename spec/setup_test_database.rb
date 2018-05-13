require 'pg'

p 'setting up test database'

def reset_database
  connection = PG.connect(dbname: 'chitter_app_test')
  connection.exec("TRUNCATE peeps CASCADE;")
  connection.exec("TRUNCATE users;")
end
