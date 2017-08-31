require 'test_helper'

class EvaluacionResidenciasControllerTest < ActionController::TestCase
  setup do
    @evaluacion_residencia = evaluacion_residencias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluacion_residencias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluacion_residencia" do
    assert_difference('EvaluacionResidencia.count') do
      post :create, evaluacion_residencia: { fecha_registro: @evaluacion_residencia.fecha_registro, id_residencia: @evaluacion_residencia.id_residencia, num_reporte: @evaluacion_residencia.num_reporte }
    end

    assert_redirected_to evaluacion_residencia_path(assigns(:evaluacion_residencia))
  end

  test "should show evaluacion_residencia" do
    get :show, id: @evaluacion_residencia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evaluacion_residencia
    assert_response :success
  end

  test "should update evaluacion_residencia" do
    patch :update, id: @evaluacion_residencia, evaluacion_residencia: { fecha_registro: @evaluacion_residencia.fecha_registro, id_residencia: @evaluacion_residencia.id_residencia, num_reporte: @evaluacion_residencia.num_reporte }
    assert_redirected_to evaluacion_residencia_path(assigns(:evaluacion_residencia))
  end

  test "should destroy evaluacion_residencia" do
    assert_difference('EvaluacionResidencia.count', -1) do
      delete :destroy, id: @evaluacion_residencia
    end

    assert_redirected_to evaluacion_residencias_path
  end
end
