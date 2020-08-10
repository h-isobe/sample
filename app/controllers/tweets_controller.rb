class TweetsController < ApplicationController
before_action :authenticate_user!

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @post_comment = PostComment.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path(@tweet)
    else
      render :new
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to tweet_path(tweet.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:image, :title, :body)
  end
end
