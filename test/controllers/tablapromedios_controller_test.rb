require 'test_helper'

class TablapromediosControllerTest < ActionController::TestCase
  setup do
    @tablapromedio = tablapromedios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tablapromedios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tablapromedio" do
    assert_difference('Tablapromedio.count') do
      post :create, tablapromedio: { nivel_desem: @tablapromedio.nivel_desem, valor_max: @tablapromedio.valor_max, valor_min: @tablapromedio.valor_min }
    end

    assert_redirected_to tablapromedio_path(assigns(:tablapromedio))
  end

  test "should show tablapromedio" do
    get :show, id: @tablapromedio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tablapromedio
    assert_response :success
  end

  test "should update tablapromedio" do
    patch :update, id: @tablapromedio, tablapromedio: { nivel_desem: @tablapromedio.nivel_desem, valor_max: @tablapromedio.valor_max, valor_min: @tablapromedio.valor_min }
    assert_redirected_to tablapromedio_path(assigns(:tablapromedio))
  end

  test "should destroy tablapromedio" do
    assert_difference('Tablapromedio.count', -1) do
      delete :destroy, id: @tablapromedio
    end

    assert_redirected_to tablapromedios_path
  end
end
