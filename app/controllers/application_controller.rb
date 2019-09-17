
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    erb :index
  end

  get '/article/new' do 
    erb :new
  end

  post '/articles' do
    title = params[:title]
    content = params[:content]
    Article.create(title: title, content: content)
    redirect '/'
  end
end
