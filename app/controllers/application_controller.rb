
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  set :method_override, true

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

  post '/articles' do
    #CREATING ARTICLE
    @article = Article.create(title: params[:title], content: params[:content])

    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    #READING ARTICLE
    @article = Article.find(params[:id])

    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do  
    @article = Article.find(params[:id])
    title = params[:title]
    content = params[:content]
    @article.update(title: title, content: content)
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect "/articles"
  end

end
