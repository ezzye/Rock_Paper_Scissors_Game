require 'forwardable'

class Game

  extend Forwardable
  attr_reader :message, :user, :user2, :variant

  def_delegator :user, :name, :user_name
  def_delegator :user, :email, :user_email
  def_delegator :user, :results, :user_results
  def_delegator :user, :pick, :user_pick
  def_delegator :user, :score, :user_score
  def_delegator :user, :played, :user_played

  def_delegator :user2, :name, :user2_name
  def_delegator :user2, :email, :user2_email
  def_delegator :user2, :results, :user2_results
  def_delegator :user2, :pick, :user2_pick
  def_delegator :user2, :score, :user2_score
  def_delegator :user2, :played, :user2_played


  def initialize(*users)
    @message = "Register or login before playing"
    (@user = users.first) unless users.empty?
    (@user2 = users.last) unless users.length < 2
    @message = "Hi #{@user.name}, click play to start game" unless users.empty?
    @variant = 'rps'
  end

  def play_spock
    self.variant = 'spock'
  end

  def play_rps
    self.variant = 'rps'
  end

  def spock?
    variant == 'spock'
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

  def winner
    return user if user.pick == :rock && ((user2.pick == :scissors) || (user2.pick == :lizard))
    return user if user.pick == :scissors && ((user2.pick == :paper) || (user2.pick == :lizard))
    return user if user.pick == :paper && ((user2.pick == :rock) || (user2.pick == :spock))
    return user if user.pick == :spock && ((user2.pick == :rock) || (user2.pick == :scissors))
    return user if user.pick == :lizard && ((user2.pick == :spock) || (user2.pick == :paper))
    user2
  end

  def loser
    winner == user ? user2 : user
  end

  attr_writer :message, :user, :variant


end