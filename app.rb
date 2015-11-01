require 'sinatra/base'
require './lib/game'
require './lib/user_log'

$userlog1 = UserLog.new

class RPS < Sinatra::Base



  get '/' do
    if $game == nil then $game = Game.new end
    @game = $game
    erb :index
  end

  get '/register' do
    erb :register
  end

  get '/login' do
    erb :login
  end

  post '/reg_start' do
    user = User.new(params[:username],params[:useremail])
    user2 = User.new('Computer','example@email.com')
    $userlog1.add_user(user)
    $game = Game.new(user,user2)
    @game = $game
    redirect '/'
  end

  post '/log_start' do
    user = $userlog1.find_user_by_username(params[:username])
    user2 = User.new('Computer','example@email.com')
    if user == nil
      redirect '/register'
    else
      $game = Game.new(user,user2)
      @game = $game
      redirect '/'
    end
  end

  get '/play' do
    @game = $game
    if @game.user == nil
      redirect '/'
    else
      erb :play
    end
  end

  get '/rock' do
    @game = $game
    @game.user.pick = :rock
    @game.user2.pick = :paper
    @game.update_score
    erb :result
  end

  get '/paper' do
    @game = $game
    @game.user.pick = :paper
    @game.user2.pick = :paper
    @game.update_score
    erb :result
  end

  get '/scissors' do
    @game = $game
    @game.user.pick = :scissors
    @game.user2.pick = :paper
    @game.update_score
    erb :result
  end

  get '/end_game' do
    $game = nil
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end


