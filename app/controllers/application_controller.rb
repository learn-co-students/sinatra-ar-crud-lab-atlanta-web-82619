require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base
  

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
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

  get '/articles/:id/edit' do
    id = params[:id]
    @article = Article.find(id)
    erb :edit
  end

  post '/articles' do
    title = params[:title]
    content = params[:content]
    a = Article.create(title: title, content: content)
    # binding.pry
    redirect "/articles/#{a.id}"
  end

  patch '/articles/:id' do
    article = Article.find(params[:id])
    title = params[:title]
    content = params[:content]
    article.update(title: title, content: content)
    redirect "articles/#{article.id}"
  end

  delete '/articles/:id/delete' do
    article = Article.find(params[:id])
    article.destroy
    redirect '/articles'
  end
end