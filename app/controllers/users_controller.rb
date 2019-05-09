class UsersController < ApplicationController
  
  get '/signup' do
    if !logged_in?
      erb :'/users/create_user'
    else
      redirect to'/tweets'
    end 
  end 
  
  post '/signup' do
    
    if params[:username].empty? && params[:password].empty? && params[:email].empty?
      binding.pry 
      redirect '/users/signup'
    end 
    
     @user = User.new(:username => params[:username], :password => params[:password])
    if user.save && !user.username.empty?
      redirect '/tweets'
    else 
      redirect '/users/signup'
    end 
  end 
  
  get '/login' do
    if !logged_in?
      erb :login 
    else
      redirect '/tweets'
    end 
  end 
  
  post '/login' do
     @user = User.new(:username => params[:username], :password => params[:password])
     if user.save && user.authenticate(params[:password])
       session[:user_id] = user.id
     else 
       redirect '/users/login'
     end
  end 
  
  get '/logout' do
    session.clear 
  end 
end 