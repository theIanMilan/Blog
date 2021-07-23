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

    if @article.save
      redirect_to articles_path, notice: "Article successfully created!"
    else
      render :new
    end
  end
  
  def edit
     @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article, notice: "Article successfully edited!"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, notice: "Article successfully deleted!"
  end

  private
  def article_params
    params.require(:article).permit(:name, :body, :status)
  end

end
