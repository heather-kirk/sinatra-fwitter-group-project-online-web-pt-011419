require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "auth_demo_lv"
  end
  
  get '/' do
    erb :index
  end 
  
  helpers do 
    
    def logged_in?
      !!session[:email]
    end 
    
    def login(email)
      if user = User.find_by(session[:email])
        session[:email] = user.email 
      else 
        redirect '/login'
      end 
    end 
    
    def current_user(session)
      @user = User.find(session[:user_id])
    end
  end 
end
