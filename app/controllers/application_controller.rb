require './config/environment'
require './app/model/user.rb'
require './app/model/recipe.rb'
require 'pry'

class ApplicationController < Sinatra::Base

   configure do
     set :public_folder, 'public'
     set :views, 'app/views'
     enable :sessions
     set :session_secret, 'flatiron'
   end
   helpers do
     def signed_in?
      session[:user_id]
     end
     def current_user
      current_user = User.find_by(session[:user_id])
     end
  end
  
    get '/' do
#     @recipes = Recipe.all
#       @users = User.all
      erb :index
    end
  
  get '/recipe' do
    @recipes = Recipe.all
    erb :recipe #goes to recipe.erb
  end
  
  post '/recipe' do
    @recipes = Recipe.create(:name => params[:name], :key_ingrediants => params[:key_ingrediants], :link => params[:link])
    redirect '/recipe'
  end
  
  post '/sign-up' do
    user = User.create(:name => params[:name], :password => params[:password])
    redirect '/'
  end
  
  post '/sign-in' do
    @user = User.find_by(:password => params[:password], :name => params[:name])
    if @user
      session[:user_id] = @user.id #every session is set with id
      redirect '/recipe'
    else
      erb :not_signed_in

    end
    
  end
  
  get '/sign-out' do
    session[:user_id] = nil
    session[:error] = nil
    redirect '/'
  end
  


  

  
#   post '/add_item' do
#     @add_item = User.new(:name => params[:name], :ingrediants => params[:ingrediants], :link => params[:link])
#     @add_item.save
#     redirect '/recipe'
#   end
  
end