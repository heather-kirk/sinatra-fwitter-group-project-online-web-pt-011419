class TweetsController < ApplicationController
  
    get '/tweets' do
      if logged_in?
      @tweets = Tweet.all
      erb :'tweets/tweets'
    else
      redirect to '/login'
    end
   end 
   
    get '/tweets/new' do
      if logged_in?
        @users = User.all
        erb :'/tweets/new'
      else
        redirect '/login'
    end 
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
       if logged_in?
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
      if logged_in?
      @tweet = Tweet.find(params[:id])
      @tweet.delete
      redirect '/tweets'
    else 
      redirect '/login'
    end 
    end 
  end  
