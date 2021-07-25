class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "ianonrails",
    except: [:index, :show]
  
  def index
    @articles = Article.order('created_at DESC')
  end

  def show
    @article = Article.find(params[:id])
  end

  def new 
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.valid?
      flash[:notice] = "Article successfully created!"
      redirect_to articles_path
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end
  
  def edit
     @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:notice] = "Article successfully edited!"
      redirect_to articles_path
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash[:notice] =  "Article successfully deleted!"
    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:name, :body, :status)
  end

end
