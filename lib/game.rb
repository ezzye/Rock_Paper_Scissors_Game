class Game
  attr_reader :message, :user

  def initialize(*users)
    @message = "Register or login before playing"
    (@user = users.first) unless users.empty?
    @message = "Hi #{@user.name}, click play to start game" unless users.empty?
  end

  private

  attr_writer :message, :user


end