require 'test_helper'

class EstadisticaServiciosControllerTest < ActionController::TestCase
  setup do
    @estadistica_servicio = estadistica_servicios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estadistica_servicios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estadistica_servicio" do
    assert_difference('EstadisticaServicio.count') do
      post :create, estadistica_servicio: { desempeño: @estadistica_servicio.desempeño, periodo: @estadistica_servicio.periodo, promedioB: @estadistica_servicio.promedioB, promedioFin: @estadistica_servicio.promedioFin }
    end

    assert_redirected_to estadistica_servicio_path(assigns(:estadistica_servicio))
  end

  test "should show estadistica_servicio" do
    get :show, id: @estadistica_servicio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estadistica_servicio
    assert_response :success
  end

  test "should update estadistica_servicio" do
    patch :update, id: @estadistica_servicio, estadistica_servicio: { desempeño: @estadistica_servicio.desempeño, periodo: @estadistica_servicio.periodo, promedioB: @estadistica_servicio.promedioB, promedioFin: @estadistica_servicio.promedioFin }
    assert_redirected_to estadistica_servicio_path(assigns(:estadistica_servicio))
  end

  test "should destroy estadistica_servicio" do
    assert_difference('EstadisticaServicio.count', -1) do
      delete :destroy, id: @estadistica_servicio
    end

    assert_redirected_to estadistica_servicios_path
  end
end
