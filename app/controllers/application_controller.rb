require './config/environment'
require './app/model/user.rb'
require './app/model/recipe.rb'
require 'pry'

class ApplicationController < Sinatra::Base

   configure do
     set :public_folder, 'public'
     set :views, 'app/views'
   end
  
    get '/' do
#     @recipes = Recipe.all

      erb :index
    end
  
  get '/recipe' do
#     @recipes = Recipe.all
    erb :recipe #goes to recipe.erb
  end
  
  post '/recipe' do
    Recipe.create(:name => params[:name], :ingrediants => params[:ingrediants], :link => params[:link])
    redirect '/'
  end
  
#   post '/add_item' do
#     @add_item = User.new(:name => params[:name], :ingrediants => params[:ingrediants], :link => params[:link])
#     @add_item.save
#     redirect '/recipe'
#   end
  
end