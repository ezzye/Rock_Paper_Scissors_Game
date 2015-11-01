require 'user'

describe User do
  subject(:user) {User.new :username, :useremail}
  let(:username) {:username}
  let(:useremail) {:useremail}

  describe '#name and #email' do
    it 'gives username of user' do
      expect(user.name).to eq username
    end
    it 'gives user email of user' do
      expect(user.email).to eq useremail
    end
  end
  describe '#pick' do
    it 'select rock, paper or scissors' do
      user.pick = :rock
      expect(user.pick).to eq :rock
    end
  end
  describe '#score' do
    it 'user score' do
      user.score += 1
      expect(user.score).to eq 1
    end
  end
  describe '#results' do
    it 'record result' do
      user.result_add :winner
      user.result_add :loser
      expect(user.results.last).to eq :loser
      expect(user.results.first).to eq :winner
    end
  end
  describe '#played' do
    it 'number of games user played' do
      user.played += 1
      expect(user.played).to eq 1
    end
  end
end