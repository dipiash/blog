class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:feed, :show, :cloud_tags, :rss]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order(created_at: :desc).all.paginate(:page => params[:page], :per_page => 7)
  end

  def feed
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 7)
    else
      @posts = Post.order(created_at: :desc).all.paginate(:page => params[:page], :per_page => 7)
    end
  end

  def rss
    respond_to do |format|
      format.html { }
      format.atom { @posts = Post.order(created_at: :desc).limit(14) }
      format.rss { @posts = Post.order(created_at: :desc).limit(14) }
    end
  end

  def cloud_tags
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Запись успешно создана.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Запись была успешно обновлена.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Запись была успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :tag_list)
    end
end
