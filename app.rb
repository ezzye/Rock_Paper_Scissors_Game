require 'sinatra/base'
require './lib/game'

class RPS < Sinatra::Base
  get '/' do
    if $game == nil then $game = Game.new end
    @game = $game
    erb :index
  end

  get '/register' do
    erb :register
  end

  post '/start' do
    user = User.new(params[:username],params[:useremail])
    $game = Game.new(user)
    @game = $game
    redirect '/'
  end

  get '/end_game' do
    $game = nil
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
