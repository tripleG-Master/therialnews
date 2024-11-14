class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]
  before_action :authorize_user!, only: %i[edit update destroy]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show  
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments or /comments.json
  def create
    #@comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id]) # Obtiene el post relacionado al comentario
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id # Asigna el usuario actual

    respond_to do |format|
      if @comment.save!
        format.html { redirect_to @post, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @post = Post.find(@comment.post_id)
    @comment.destroy!

    respond_to do |format|
      format.html { redirect_to @post, status: :see_other, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:description, :user_id, :post_id)
    end

    # autorizamos a la edicion o eliminacion de los comments
    def authorize_user!
      unless @comment.user_id == current_user.id || current_user.role.role == "admin"
        redirect_to comments_path, alert: "Not permission to do that"
      end
    end
end
