class MainController < ApplicationController
  
  def index
    @template = Constants::TEMPLATE
  end

  def confirm

    full_sanitizer = Rails::Html::FullSanitizer.new
    session['body'] = full_sanitizer.sanitize(params['body'])
    session['title'] = params['title']
    session['author'] = params['author']
    session['conference'] = params['conference']
    session['publish_year'] = params['publish_year']
  end

  def upload

    Entry.create({
      user_id: session[:user_id],
      body: session['body'],
      title: session['title'],
      author:  session['author'],
      conference:  session['conference'],
      publish_year: session['publish_year']
    })
  end
end
