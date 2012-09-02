require 'test_helper'

class BtagsControllerTest < ActionController::TestCase
  setup do
    @btag = btags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:btags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create btag" do
    assert_difference('Btag.count') do
      post :create, btag: { tags: @btag.tags, title: @btag.title }
    end

    assert_redirected_to btag_path(assigns(:btag))
  end

  test "should show btag" do
    get :show, id: @btag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @btag
    assert_response :success
  end

  test "should update btag" do
    put :update, id: @btag, btag: { tags: @btag.tags, title: @btag.title }
    assert_redirected_to btag_path(assigns(:btag))
  end

  test "should destroy btag" do
    assert_difference('Btag.count', -1) do
      delete :destroy, id: @btag
    end

    assert_redirected_to btags_path
  end
end
