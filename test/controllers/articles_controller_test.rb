require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    login(:admin)

    get :new
    assert_response :success
  end

  test "should create article" do
    login(:admin)

    assert_difference('Article.count') do
      post :create, article: { locale: @article.locale, author: @article.author, content: @article.content, title: @article.title }
    end

    assert_redirected_to article_path(assigns(:article))
  end

  test "should show article" do
    get :show, id: @article
    assert_response :success
  end

  test "should get edit" do
    login(:admin)

    get :edit, id: @article
    assert_response :success
  end

  test "should update article" do
    login(:admin)

    patch :update, id: @article, article: { author: @article.author, content: @article.content, title: @article.title }
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    login(:admin)

    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_redirected_to articles_path
  end

  private
    def login(user)
      @request.env["devise.mapping"] = Devise.mappings[user]
      @admin = users(user)
      @admin.add_role(user)
      sign_in users(user)
    end
end
