class Api::V1::PostsController < ApplicationController
  
  # 投稿したブログを全て取得する
  def index
    @posts = Post.all
    render json: @posts
  end
　
  # 投稿したブログの固有ページを取得する
  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  # ブログを作成する
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.:errors, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render json: @post, status: :created
    else
      render json: @post.:errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destory
  end

  private

  def post_params
    params.require(:post).permit(:title,:content)
  end  
end
