
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do 
    erb :new
  end

  get '/articles/:id' do
    id = params[:id]
    @article = Article.find(id)
    erb :show
  end

  post '/articles' do
    title = params[:title]
    content = params[:content]
    a = Article.create(title: title, content: content)
    # binding.pry
    redirect "/articles/#{a.id}"
  end
end
