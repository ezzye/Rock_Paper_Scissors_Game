require 'sinatra/base'
require './lib/game'
require './lib/user'
require './lib/user_log'
require './lib/rand_pick'

$userlog1 = UserLog.new

class RPS < Sinatra::Base

choices = $choices

  get '/' do
    if $game == nil then $game = Game.new end
    @game = $game
    $choices = [:rock,:paper,:scissors]
    erb :index
  end

  get '/register' do
    erb :register
  end

  get '/login' do
    erb :login
  end

  get '/spock_lizard' do
    @game = $game
    @game.play_spock
    $game = @game
    $choices = [:rock,:paper,:scissors,:spock,:lizard]
    erb :play
  end

  get '/rps' do
    @game = $game
    @game.play_rps
    $game = @game
    $choices = [:rock,:paper,:scissors]
    erb :play
  end

    get '/spock_lizard2' do
    @game = $game
    @game.play_spock
    $game = @game
    $choices = [:rock,:paper,:scissors,:spock,:lizard]
    erb :play2
  end

  get '/rps2' do
    @game = $game
    @game.play_rps
    $game = @game
    $choices = [:rock,:paper,:scissors]
    erb :play2
  end

  get '/register2' do
    erb :register2
  end

  get '/login2' do
    erb :login2
  end

  get '/play2' do
    @game = $game
    erb :play2
  end

  post '/reg_start' do
    user = User.new(params[:username],params[:useremail])
    $userlog1.add_user(user)
    redirect '/user2'
  end

  post '/log_start' do
    user = $userlog1.find_user_by_username(params[:username])
    if user == nil
      redirect '/register'
    else
      $userlog1.add_user(user)
      redirect '/user2'
    end
  end

  post '/reg_start2' do
    user2 = User.new(params[:username],params[:useremail])
    user=$userlog1.userlog.last
    $userlog1.add_user(user2)
    $game = Game.new(user,user2)
    @game = $game
    redirect '/play2'
  end

  post '/log_start2' do
    user2 = $userlog1.find_user_by_username(params[:username])
    if user2 == nil
      redirect '/register2'
    else
      user=$userlog1.userlog.last
      $userlog1.add_user(user2)
      $game = Game.new(user,user2)
      @game = $game
      redirect '/play2'
    end
  end

  get '/user2' do
    if $game == nil then $game = Game.new end
    @game = $game
    erb :user2
  end

  get '/play' do
    @game = $game
    user = $userlog1.userlog.last
    user2 = User.new('Computer','example@email.com')
    $userlog1.add_user(user2)
    $game = Game.new(user,user2)
    @game = $game
    erb :play
  end

  get '/play_again' do
    @game = $game
    erb :play
  end

  post '/my_choice' do
    @game = $game
    @game.user.pick = params[:my_choice].to_sym
    p @game.user.pick #test
    @game.user2.pick = RandPick.run($choices)
    @game.update_score
    erb :result
  end

  get '/rock2' do
    @game = $game
    @game.user.pick = :rock
    erb :result2
  end

  get '/paper2' do
    @game = $game
    @game.user.pick = :paper
    erb :result2
  end

  get '/spock2' do
    @game = $game
    @game.user.pick = :spock
    erb :result2
  end

    get '/lizard2' do
    @game = $game
    @game.user.pick = :lizard
    erb :result2
  end

  get '/scissors2' do
    @game = $game
    @game.user.pick = :scissors
    erb :result2
  end

   get '/rock3' do
    @game = $game
    @game.user2.pick = :rock
    @game.update_score
    erb :result3
  end

  get '/paper3' do
    @game = $game
    @game.user2.pick = :paper
    @game.update_score
    erb :result3
  end

  get '/scissors3' do
    @game = $game
    @game.user2.pick = :scissors
    @game.update_score
    erb :result3
  end

    get '/spock3' do
    @game = $game
    @game.user2.pick = :spock
    @game.update_score
    erb :result3
  end

    get '/lizard3' do
    @game = $game
    @game.user2.pick = :lizard
    @game.update_score
    erb :result3
  end

  get '/end_game' do
    $game = nil
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end


