class UsersController < ApplicationController
  
  get '/signup' do
    erb :create_user
  end 
  
  post '/signup' do
    @user = User.new(:username => params[:username], :password => params[:password])
    if user.save
      redirect '/login'
    else 
      redirect '/index'
    end 
  end 
  
  get '/login' do
    erb :login 
  end 
  
  post '/login' do
    
  end 
  get '/logout' do
    session.clear 
  end 
end 