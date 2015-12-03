class MainController < ApplicationController
  
  def index
    @template = Constants::TEMPLATE
  end

  def confirm

    full_sanitizer = Rails::Html::FullSanitizer.new
    session['body'] = full_sanitizer.sanitize(params['body'])
    session['title'] = full_sanitizer.sanitize(params['title'])
    session['author'] = full_sanitizer.sanitize(params['author'])
    session['conference'] = full_sanitizer.sanitize(params['conference'])
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
    session['body'] = nil
    session['title'] = nil
    session['author'] = nil
    session['conference'] = nil
    session['publish_year'] = nil
  end
end
