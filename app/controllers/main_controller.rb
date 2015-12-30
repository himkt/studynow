class MainController < ApplicationController
  
  def index
    @entries = Entry.get_all_entries.page(params[:page])
  end

  def create
    @template = Constants::TEMPLATE
  end

  def detail
    @entry = Entry.get_entry_by_id params['id']
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

    @entry = Entry.create({
      user_id: session[:user_id],
      body: session['body'],
      title: session['title'],
      author:  session['author'],
      conference:  session['conference'],
      publish_year: session['publish_year']
    })

    if @entry
      session['body'] = nil
      session['title'] = nil
      session['author'] = nil
      session['conference'] = nil
      session['publish_year'] = nil
    end
  end
end
