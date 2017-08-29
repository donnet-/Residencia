require 'test_helper'

class ComentarioEgresadosControllerTest < ActionController::TestCase
  setup do
    @comentario_egresado = comentario_egresados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comentario_egresados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comentario_egresado" do
    assert_difference('ComentarioEgresado.count') do
      post :create, comentario_egresado: { opinion: @comentario_egresado.opinion }
    end

    assert_redirected_to comentario_egresado_path(assigns(:comentario_egresado))
  end

  test "should show comentario_egresado" do
    get :show, id: @comentario_egresado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comentario_egresado
    assert_response :success
  end

  test "should update comentario_egresado" do
    patch :update, id: @comentario_egresado, comentario_egresado: { opinion: @comentario_egresado.opinion }
    assert_redirected_to comentario_egresado_path(assigns(:comentario_egresado))
  end

  test "should destroy comentario_egresado" do
    assert_difference('ComentarioEgresado.count', -1) do
      delete :destroy, id: @comentario_egresado
    end

    assert_redirected_to comentario_egresados_path
  end
end
