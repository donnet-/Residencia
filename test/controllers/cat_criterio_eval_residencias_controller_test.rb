require 'test_helper'

class CatCriterioEvalResidenciasControllerTest < ActionController::TestCase
  setup do
    @cat_criterio_eval_residencia = cat_criterio_eval_residencias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cat_criterio_eval_residencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cat_criterio_eval_residencia" do
    assert_difference('CatCriterioEvalResidencia.count') do
      post :create, cat_criterio_eval_residencia: { criterio_eval: @cat_criterio_eval_residencia.criterio_eval, status: @cat_criterio_eval_residencia.status, valor: @cat_criterio_eval_residencia.valor }
    end

    assert_redirected_to cat_criterio_eval_residencia_path(assigns(:cat_criterio_eval_residencia))
  end

  test "should show cat_criterio_eval_residencia" do
    get :show, id: @cat_criterio_eval_residencia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cat_criterio_eval_residencia
    assert_response :success
  end

  test "should update cat_criterio_eval_residencia" do
    patch :update, id: @cat_criterio_eval_residencia, cat_criterio_eval_residencia: { criterio_eval: @cat_criterio_eval_residencia.criterio_eval, status: @cat_criterio_eval_residencia.status, valor: @cat_criterio_eval_residencia.valor }
    assert_redirected_to cat_criterio_eval_residencia_path(assigns(:cat_criterio_eval_residencia))
  end

  test "should destroy cat_criterio_eval_residencia" do
    assert_difference('CatCriterioEvalResidencia.count', -1) do
      delete :destroy, id: @cat_criterio_eval_residencia
    end

    assert_redirected_to cat_criterio_eval_residencias_path
  end
end
