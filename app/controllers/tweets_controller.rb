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
      @tweet = Tweet.find(params[:id])
      erb :'/tweets/show'
    end
    
    get '/tweets/:id/edit' do
      @tweet = Tweet.find(params[:id])
      @users = User.all
      erb :'/tweets/edit'
    end 
    
    patch '/tweets/:id' do
      @tweet = Tweet.find(params[:id])
      @tweet.update(params["tweet"])
      @tweet.save
      redirect "tweets/#{@tweet_id}"
    end 
    
    delete '/tweets/:id/delete' do
      @tweet = Tweet.find(params[:id])
      @tweet.delete
      redirect '/tweets'
    end 
  end  
