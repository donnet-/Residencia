require 'test_helper'

class ExpectativasEgresadosControllerTest < ActionController::TestCase
  setup do
    @expectativas_egresado = expectativas_egresados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expectativas_egresados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expectativas_egresado" do
    assert_difference('ExpectativasEgresado.count') do
      post :create, expectativas_egresado: { cursos_actualizacion: @expectativas_egresado.cursos_actualizacion, describir: @expectativas_egresado.describir, tomar_posgrado: @expectativas_egresado.tomar_posgrado }
    end

    assert_redirected_to expectativas_egresado_path(assigns(:expectativas_egresado))
  end

  test "should show expectativas_egresado" do
    get :show, id: @expectativas_egresado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expectativas_egresado
    assert_response :success
  end

  test "should update expectativas_egresado" do
    patch :update, id: @expectativas_egresado, expectativas_egresado: { cursos_actualizacion: @expectativas_egresado.cursos_actualizacion, describir: @expectativas_egresado.describir, tomar_posgrado: @expectativas_egresado.tomar_posgrado }
    assert_redirected_to expectativas_egresado_path(assigns(:expectativas_egresado))
  end

  test "should destroy expectativas_egresado" do
    assert_difference('ExpectativasEgresado.count', -1) do
      delete :destroy, id: @expectativas_egresado
    end

    assert_redirected_to expectativas_egresados_path
  end
end
