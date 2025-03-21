require 'sinatra'

class App < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    '<h2>Hello <em>World</em>!</h2>'
  end

  get '/dice' do
    dice_roll = rand(1..6)
    { roll:dice_roll}.to_json
  end

  get '/add/:num1/:num2' do
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i
    sum = num1 + num2
    {result:sum}.to_json
  end

  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json
  end
  
end

run App
