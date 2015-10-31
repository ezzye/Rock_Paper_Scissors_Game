require 'user'

describe User do
  subject(:user) {User.new :username, :useremail}
  let(:username) {:username}
  let(:useremail) {:useremail}

  describe '#name' do
    it 'gives username of user' do
      expect(user.name).to eq username
    end
    it 'gives user email of user' do
      expect(user.email).to eq useremail
    end
  end
end