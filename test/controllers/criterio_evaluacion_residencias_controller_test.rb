require 'test_helper'

class CriterioEvaluacionResidenciasControllerTest < ActionController::TestCase
  setup do
    @criterio_evaluacion_residencia = criterio_evaluacion_residencias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:criterio_evaluacion_residencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create criterio_evaluacion_residencia" do
    assert_difference('CriterioEvaluacionResidencia.count') do
      post :create, criterio_evaluacion_residencia: { califiacion_criterio: @criterio_evaluacion_residencia.califiacion_criterio, id_cat_criterio_eva: @criterio_evaluacion_residencia.id_cat_criterio_eva, id_evaluacion: @criterio_evaluacion_residencia.id_evaluacion }
    end

    assert_redirected_to criterio_evaluacion_residencia_path(assigns(:criterio_evaluacion_residencia))
  end

  test "should show criterio_evaluacion_residencia" do
    get :show, id: @criterio_evaluacion_residencia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @criterio_evaluacion_residencia
    assert_response :success
  end

  test "should update criterio_evaluacion_residencia" do
    patch :update, id: @criterio_evaluacion_residencia, criterio_evaluacion_residencia: { califiacion_criterio: @criterio_evaluacion_residencia.califiacion_criterio, id_cat_criterio_eva: @criterio_evaluacion_residencia.id_cat_criterio_eva, id_evaluacion: @criterio_evaluacion_residencia.id_evaluacion }
    assert_redirected_to criterio_evaluacion_residencia_path(assigns(:criterio_evaluacion_residencia))
  end

  test "should destroy criterio_evaluacion_residencia" do
    assert_difference('CriterioEvaluacionResidencia.count', -1) do
      delete :destroy, id: @criterio_evaluacion_residencia
    end

    assert_redirected_to criterio_evaluacion_residencias_path
  end
end
