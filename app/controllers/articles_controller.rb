class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  respond_to :html

  def index
    @articles = Article.where(:locale => I18n.locale).page(params[:page])
    respond_with(@articles)
  end

  def show
    respond_with(@article)
  end

  def new
    if (params[:original_id])
      @original = Article.find_by_id(params[:original_id])
      raise NotFoundError.new 'Original not found' if @original.nil?
      @article = @original.translations.build
    else
      @article = Article.new({:locale => I18n.default_locale})
    end

    respond_with(@article)
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user
    @article.save
    respond_with(@article)
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:locale, :original_id, :title, :content)
    end
end
