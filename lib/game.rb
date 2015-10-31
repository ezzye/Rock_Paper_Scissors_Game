class Game
  attr_reader :message, :user, :user2

  def initialize(*users)
    @message = "Register or login before playing"
    (@user = users.first) unless users.empty?
    (@user2 = users.last) unless users.length < 2
    @message = "Hi #{@user.name}, click play to start game" unless users.empty?
  end

  private

  attr_writer :message, :user


end