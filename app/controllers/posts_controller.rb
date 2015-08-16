class PostsController < ApplicationController
	before_action :set_post, only: [:edit, :update]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render :new
		end
	end

	def show
	  @post = Post.includes(:comments).find(params[:id])
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render :edit
		end
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content)
	end
end
