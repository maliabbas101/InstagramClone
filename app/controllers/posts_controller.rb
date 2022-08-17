# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index
    @posts = Post.all
    @posts = policy_scope(Post).reverse
  end

  def show; end

  def new
    @post = Post.new
    authorize @post
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    authorize @post
    if @post.save
      redirect_to @post, notice: 'Post was successfully created'
    else
      render "new", notice: "Something went wrong"
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated"
    else
      render "edit", notice: "Something went wrong"
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_url, notice: "Post was successfully deleted."
    else
      redirect_to posts_url, notice: "Something went wrong"
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:caption, :user_id, images: [])
  end
end
