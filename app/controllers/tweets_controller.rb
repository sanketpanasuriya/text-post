class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /tweets
  def index
    @tweets = Tweet.all
  end

  def my_tweets
    @tweets = Tweet.by_user(current_user.id)
  end

  # GET /tweets/1
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    respond_to do |format|
      if @tweet.save
        notice = 'Tweet was successfully created.' 
        format.html { redirect_to tweet_url(@tweet), notice: notice}
        format.js { flash.now.notice = notice}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.js { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        notice = 'Tweet was successfully updated.'
        format.html { redirect_to tweet_url(@tweet), notice: notice }
        format.js { flash.now.notice = notice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.js { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy

    respond_to do |format|
      notice = 'Tweet was successfully destroyed.'
      format.html { redirect_to tweets_url, notice: notice }
      format.js { flash.now.notice = notice }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content, files: [])
    end
end
