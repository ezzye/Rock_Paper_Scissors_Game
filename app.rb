require 'sinatra/base'
require './lib/game'
require './lib/user_log'

class RPS < Sinatra::Base

  $userlog1 = UserLog.new

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
    $userlog1.add_user(user)
    $game = Game.new(user)
    @game = $game
    redirect '/'
  end

  post '/log_start' do
    user = $userlog1.find_user_by_username(params[:username])
    if user == nil
      redirect '/register'
    else
      $game = Game.new(user)
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

  get '/end_game' do
    $game = nil
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end


