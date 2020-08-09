class PostCommentsController < ApplicationController

  def create
    tweet = Tweet.find(params[:tweet_id])
    post_comment = current_user.post_comments.new(post_comment_params)
    post_comment.tweet_id = tweet.id
    post_comment.save
    redirect_to tweet_path(tweet.id)
  end

  def destroy
    PostComment.find_by(id: params[:id], tweet_id: params[:tweet_id]).destroy
    redirect_to tweet_path(params[:tweet_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end