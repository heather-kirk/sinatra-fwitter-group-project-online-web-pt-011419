class TweetsController < ApplicationController
  
  
    get '/tweets/new' do
      @users = User.all
      erb :'/tweets/new' 
    end 
  
    post '/tweets' do
     @tweet = Tweet.create(params[:tweet])
      @tweet.save 
      redirect "tweets/#{@tweet_id}"
    end 
  
    get '/tweets/:id' do
      if Helpers.logged_in?
        @tweet = Tweet.find(params[:id])
        erb :'/tweets/show_tweet'
      else 
        redirect '/users/login'
      end 
    end
    
    get '/tweets/:id/edit' do
       if Helpers.logged_in?
         @tweet = Tweet.find(params[:id])
         @users = User.all
         erb :'/tweets/edit_tweet'
       else 
         redirect '/users/login'
       end 
    end 
    
    patch '/tweets/:id' do
      if Helpers.logged_in?
        @tweet = Tweet.find(params[:id])
        @tweet.update(params["tweet"])
        @tweet.save
      redirect "tweets/#{@tweet_id}"
    else 
        redirect '/users/login'
      end 
    end 
    
    delete '/tweets/:id/delete' do
      @tweet = Tweet.find(params[:id])
      @tweet.delete
      redirect '/tweets'
    end 
  end  
