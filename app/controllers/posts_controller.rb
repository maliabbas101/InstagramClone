# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render 'new', notice: 'Something went wrong'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Object was successfully updated'
    else
      render 'edit', notice: 'Something went wrong'
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_url, notice: 'Object was successfully deleted.'
    else
      redirect_to posts_url, notice: 'Something went wrong'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :user_id, images: [])
  end
end
