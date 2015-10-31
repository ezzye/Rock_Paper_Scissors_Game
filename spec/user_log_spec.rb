require 'user_log'

describe UserLog do
  subject(:userlog) {UserLog.new}
  let(:user1) {double(:user1, name: 'Ezzy')}

  describe '#add_user' do
    it 'user added to log' do
      expect(userlog.add_user user1).to eq user1
    end
  end
  describe '#find_user_by_username' do
    it 'user found' do
      userlog.add_user user1
      expect(userlog.find_user_by_username('Ezzy')).to eq user1
    end
  end
end