require 'user'

describe User do
  describe '#create' do
    it 'adds user to the database' do
      user = User.create('Muzzi Aldean', 'demooz42', 'test@test.com', 'password123')
      expect(user.id).not_to be_nil
    end
  end

  describe '#all' do
    it 'returns a list of users as user objects' do
      user = User.create('Muzzi Aldean', 'demooz42', 'test@test.com', 'password123')
      expect(User.all.map(&:id)).to include user.id
    end
  end
end
