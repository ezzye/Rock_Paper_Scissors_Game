require 'sinatra/base'
require './lib/game'
require './lib/user'
require './lib/user_log'
require './lib/rand_pick'



$userlog1 = UserLog.new

class RPS < Sinatra::Base

choices = $choices

enable :sessions

  get '/' do
    session["user"] ||= nil
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
    @game.user2.pick = RandPick.run($choices)
    @game.update_score
    erb :result
  end

  post '/my_choice2' do
    @game = $game
    @game.user.pick = params[:my_choice].to_sym
    erb :result2
  end

  post '/my_choice3' do
    @game = $game
    @game.user2.pick = params[:my_choice].to_sym
    @game.update_score
    erb :result3
  end

  post '/reg_start' do
    session["user"] = params[:username]
    user = User.new(params[:username],params[:useremail])
    $userlog1.add_user(user)
    redirect '/user2'
  end

  post '/log_start' do
    session["user"] = params[:username]
    user = $userlog1.find_user_by_username(params[:username])
    if user == nil
      redirect '/register'
    else
      $userlog1.add_user(user)
      redirect '/user2'
    end
  end

  get '/end_game' do
    session["user"] = nil
    $game = nil
    redirect '/'
  end

  get '/multiplayer' do
    @game = $game
    erb :multiplayer
  end

  post '/my_choice4' do
    @game = $game
    @user = $userlog1.find_user_by_username(session["user"])
    @user.pick = params[:my_choice].to_sym
    erb :user3
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end


