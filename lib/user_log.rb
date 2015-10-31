class UserLog

  attr_reader :userlog

  def initialize
    @userlog = []
  end

  def add_user user
    userlog << user
    user
  end

  def find_user_by_username username
    userlog.select{|user| user.name == username}.first
  end
end