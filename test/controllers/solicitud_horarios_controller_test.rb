require 'test_helper'

class SolicitudHorariosControllerTest < ActionController::TestCase
  setup do
    @solicitud_horario = solicitud_horarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solicitud_horarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create solicitud_horario" do
    assert_difference('SolicitudHorario.count') do
      post :create, solicitud_horario: { dia_inicio: @solicitud_horario.dia_inicio, dia_termino: @solicitud_horario.dia_termino, hora_inicio: @solicitud_horario.hora_inicio, hora_termino: @solicitud_horario.hora_termino, solicitud_id: @solicitud_horario.solicitud_id }
    end

    assert_redirected_to solicitud_horario_path(assigns(:solicitud_horario))
  end

  test "should show solicitud_horario" do
    get :show, id: @solicitud_horario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @solicitud_horario
    assert_response :success
  end

  test "should update solicitud_horario" do
    patch :update, id: @solicitud_horario, solicitud_horario: { dia_inicio: @solicitud_horario.dia_inicio, dia_termino: @solicitud_horario.dia_termino, hora_inicio: @solicitud_horario.hora_inicio, hora_termino: @solicitud_horario.hora_termino, solicitud_id: @solicitud_horario.solicitud_id }
    assert_redirected_to solicitud_horario_path(assigns(:solicitud_horario))
  end

  test "should destroy solicitud_horario" do
    assert_difference('SolicitudHorario.count', -1) do
      delete :destroy, id: @solicitud_horario
    end

    assert_redirected_to solicitud_horarios_path
  end
end
