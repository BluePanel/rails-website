require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    login(:admin)

    get :new
    assert_response :success
  end

  test "should create project" do
    login(:admin)

    assert_difference('Project.count') do
      post :create, project: { description: @project.description, link: @project.link, name: @project.name }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    login(:admin)

    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    login(:admin)

    patch :update, id: @project, project: { description: @project.description, link: @project.link, name: @project.name }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    login(:admin)

    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end

  private
    def login(user)
      @request.env["devise.mapping"] = Devise.mappings[user]
      @admin = users(user)
      @admin.add_role(user)
      sign_in users(user)
    end
end
