class CommentsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "ianonrails",
    only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if @comment.valid?
      flash[:notice] = "Added comment successfully!"
      redirect_to article_path(@article)
    else
      flash[:alert] = "Something went wrong..."
      redirect_to article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted successfully!"
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
