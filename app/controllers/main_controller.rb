class MainController < ApplicationController
  def index
    @update = true if params["flash"] == "updated"
    @overed = true if params["flash"] == "overed"
  end

  def update
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Settings.twitter.consumer_key
      config.consumer_secret     = Settings.twitter.consumer_secret
      config.access_token        = session[:oauth_token]
      config.access_token_secret = session[:oauth_token_secret]
    end

    if params[:text].size == 0
      redirect_to :action => "index"
    elsif params[:text].size >= 140
      redirect_to :action => "index", :flash => "overed"
    else
      client.update(params[:text])
      Memo.create({"user_id" => session[:user_id], "text" => params[:text]})
      redirect_to :action => "index", :flash => "updated"
    end
  end
end
