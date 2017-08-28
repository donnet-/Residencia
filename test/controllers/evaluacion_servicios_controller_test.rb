require 'test_helper'

class EvaluacionServiciosControllerTest < ActionController::TestCase
  setup do
    @evaluacion_servicio = evaluacion_servicios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluacion_servicios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluacion_servicio" do
    assert_difference('EvaluacionServicio.count') do
      post :create, evaluacion_servicio: { fecha_registro_servicio: @evaluacion_servicio.fecha_registro_servicio, id_servicio_social: @evaluacion_servicio.id_servicio_social, num_reporte: @evaluacion_servicio.num_reporte, pdf_eval_servicio: @evaluacion_servicio.pdf_eval_servicio }
    end

    assert_redirected_to evaluacion_servicio_path(assigns(:evaluacion_servicio))
  end

  test "should show evaluacion_servicio" do
    get :show, id: @evaluacion_servicio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evaluacion_servicio
    assert_response :success
  end

  test "should update evaluacion_servicio" do
    patch :update, id: @evaluacion_servicio, evaluacion_servicio: { fecha_registro_servicio: @evaluacion_servicio.fecha_registro_servicio, id_servicio_social: @evaluacion_servicio.id_servicio_social, num_reporte: @evaluacion_servicio.num_reporte, pdf_eval_servicio: @evaluacion_servicio.pdf_eval_servicio }
    assert_redirected_to evaluacion_servicio_path(assigns(:evaluacion_servicio))
  end

  test "should destroy evaluacion_servicio" do
    assert_difference('EvaluacionServicio.count', -1) do
      delete :destroy, id: @evaluacion_servicio
    end

    assert_redirected_to evaluacion_servicios_path
  end
end
