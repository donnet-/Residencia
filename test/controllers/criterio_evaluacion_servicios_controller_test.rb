require 'test_helper'

class CriterioEvaluacionServiciosControllerTest < ActionController::TestCase
  setup do
    @criterio_evaluacion_servicio = criterio_evaluacion_servicios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:criterio_evaluacion_servicios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create criterio_evaluacion_servicio" do
    assert_difference('CriterioEvaluacionServicio.count') do
      post :create, criterio_evaluacion_servicio: { calificacion_criterio: @criterio_evaluacion_servicio.calificacion_criterio, id_cat_criterio_eva: @criterio_evaluacion_servicio.id_cat_criterio_eva, id_evalucacion: @criterio_evaluacion_servicio.id_evalucacion }
    end

    assert_redirected_to criterio_evaluacion_servicio_path(assigns(:criterio_evaluacion_servicio))
  end

  test "should show criterio_evaluacion_servicio" do
    get :show, id: @criterio_evaluacion_servicio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @criterio_evaluacion_servicio
    assert_response :success
  end

  test "should update criterio_evaluacion_servicio" do
    patch :update, id: @criterio_evaluacion_servicio, criterio_evaluacion_servicio: { calificacion_criterio: @criterio_evaluacion_servicio.calificacion_criterio, id_cat_criterio_eva: @criterio_evaluacion_servicio.id_cat_criterio_eva, id_evalucacion: @criterio_evaluacion_servicio.id_evalucacion }
    assert_redirected_to criterio_evaluacion_servicio_path(assigns(:criterio_evaluacion_servicio))
  end

  test "should destroy criterio_evaluacion_servicio" do
    assert_difference('CriterioEvaluacionServicio.count', -1) do
      delete :destroy, id: @criterio_evaluacion_servicio
    end

    assert_redirected_to criterio_evaluacion_servicios_path
  end
end
