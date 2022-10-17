class PostsController < ApplicationController
    before_action :authenticate_user!
    require 'itunes-search-api'
    
    def index
        @posts = current_user.posts.all
    end

    def new
        @post = Post.new
    end

    def create
        post = Post.new(post_params)
        songurl = params[:post][:song]
        songurl.slice!(0,23)
        post.song = songurl
        post.user_id = current_user.id
        if post.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end    

    def edit
      @post = Post.find(params[:id])
    end

    def update
      post = Post.find(params[:id])
      songurl = params[:post][:song]
        songurl.slice!(0,23)
        post.song = songurl
        post.user_id = current_user.id
      if post.update(post_params)
        redirect_to :action => "index", :id => post.id
      else
        redirect_to :action => "edit"
      end
    end

    private
    def post_params
    params.require(:post).permit(:user_id,:artist,:song)
    end
  end