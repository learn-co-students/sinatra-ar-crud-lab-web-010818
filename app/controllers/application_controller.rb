require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :posts
  end

    get'/posts/new' do
    erb :new
  end

    post '/posts' do
      @post = Post.create(name: params[:name], content: params[:content])
      @posts = Post.all
      erb :posts
    end

    get '/posts/:id' do
      @chosen_post = Post.find(params[:id])
      erb :'show.html'
    end

    get '/posts/:id/edit' do
        id = params[:id].to_i
        @old_post = Post.find(id)
      erb :'edit.html'
    end

    patch '/posts/:id' do
      id = params[:id].to_i
      @post_to_edit = Post.find(id)
      @post_to_edit.name = params["name"]
      @post_to_edit.content = params["content"]
      @post_to_edit.save
      redirect "/posts/#{@post_to_edit.id}"
    end

    delete '/posts/:id/delete' do
      @delete_post = Post.find(params[:id])
      @delete_post.delete


      erb :'delete.html'
    end




end
