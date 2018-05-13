require 'pg'

class Peep

  attr_reader :text, :time

  def initialize(text, time)
    @text = text
    @time = time
  end

  def self.all
    result = choose_database.exec("SELECT * FROM peeps;")
    result.map { |result| Peep.new(result['text'], result['timestamp']) }.reverse
  end

  def self.create(text)
    result = choose_database.exec("INSERT INTO peeps (text) VALUES('#{text}');")
  end

  private

  def self.choose_database
    ENV['ENVIRONMENT'] == 'test' ? PG.connect(dbname:'chitter_app_test') : PG.connect(dbname:'chitter_app')
  end

end
