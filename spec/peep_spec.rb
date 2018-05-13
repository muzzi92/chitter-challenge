require 'peep'

describe Peep do
  describe '#all' do
    connection = PG.connect(dbname: 'chitter_app_test')
    it 'returns an array of all peeps in the database' do
      connection.exec("INSERT INTO peeps (text) VALUES('my first comment');")
      expect(Peep.all[0].text).to eq('my first comment')
    end
  end

  describe '#create' do
    it 'inputs text to the database' do
      Peep.create('my second comment')
      expect(Peep.all[0].text).to eq('my second comment')
    end
  end
end
