class MainController < ApplicationController
  def index
    if params["flash"]
       @update = true
    end
  end

  def update
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Settings.twitter.consumer_key
      config.consumer_secret     = Settings.twitter.consumer_secret
      config.access_token        = session[:oauth_token]
      config.access_token_secret = session[:oauth_token_secret]
    end
    unless params[:text] == ""
      client.update(params[:text])
      redirect_to :action => "index", :flash => "updated"
    else
      redirect_to :action => "index"
    end
  end
end
