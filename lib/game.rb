class Game
  attr_reader :message, :user, :user2

  def initialize(*users)
    @message = "Register or login before playing"
    (@user = users.first) unless users.empty?
    (@user2 = users.last) unless users.length < 2
    @message = "Hi #{@user.name}, click play to start game" unless users.empty?
  end

  def winner
    return user if user.pick == :rock && user2.pick == :scissors
    return user if user.pick == :scissors && user2.pick == :paper
    return user if user.pick == :paper && user2.pick == :rock
    user2
  end

  def loser
    winner == user ? user2 : user
  end


  def update_score
    user.played +=1
    user2.played +=1
    if user.pick == user2.pick
      user.result_add :draw
      user2.result_add :draw
    else
      winner.score +=1
      winner.result_add :winner
      loser.result_add :loser
    end
  end

  private

  attr_writer :message, :user


end