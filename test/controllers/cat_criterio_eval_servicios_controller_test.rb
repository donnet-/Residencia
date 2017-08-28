require 'test_helper'

class CatCriterioEvalServiciosControllerTest < ActionController::TestCase
  setup do
    @cat_criterio_eval_servicio = cat_criterio_eval_servicios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cat_criterio_eval_servicios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cat_criterio_eval_servicio" do
    assert_difference('CatCriterioEvalServicio.count') do
      post :create, cat_criterio_eval_servicio: { cal_A: @cat_criterio_eval_servicio.cal_A, nombre_criterio: @cat_criterio_eval_servicio.nombre_criterio, status: @cat_criterio_eval_servicio.status }
    end

    assert_redirected_to cat_criterio_eval_servicio_path(assigns(:cat_criterio_eval_servicio))
  end

  test "should show cat_criterio_eval_servicio" do
    get :show, id: @cat_criterio_eval_servicio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cat_criterio_eval_servicio
    assert_response :success
  end

  test "should update cat_criterio_eval_servicio" do
    patch :update, id: @cat_criterio_eval_servicio, cat_criterio_eval_servicio: { cal_A: @cat_criterio_eval_servicio.cal_A, nombre_criterio: @cat_criterio_eval_servicio.nombre_criterio, status: @cat_criterio_eval_servicio.status }
    assert_redirected_to cat_criterio_eval_servicio_path(assigns(:cat_criterio_eval_servicio))
  end

  test "should destroy cat_criterio_eval_servicio" do
    assert_difference('CatCriterioEvalServicio.count', -1) do
      delete :destroy, id: @cat_criterio_eval_servicio
    end

    assert_redirected_to cat_criterio_eval_servicios_path
  end
end
