require 'test_helper'

class ParticipacionSocialesControllerTest < ActionController::TestCase
  setup do
    @participacion_social = participacion_sociales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participacion_sociales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participacion_social" do
    assert_difference('ParticipacionSocial.count') do
      post :create, participacion_social: { asociacion_egresados: @participacion_social.asociacion_egresados, describir: @participacion_social.describir, organismo_profesionistas: @participacion_social.organismo_profesionistas, organizacion_social: @participacion_social.organizacion_social }
    end

    assert_redirected_to participacion_social_path(assigns(:participacion_social))
  end

  test "should show participacion_social" do
    get :show, id: @participacion_social
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @participacion_social
    assert_response :success
  end

  test "should update participacion_social" do
    patch :update, id: @participacion_social, participacion_social: { asociacion_egresados: @participacion_social.asociacion_egresados, describir: @participacion_social.describir, organismo_profesionistas: @participacion_social.organismo_profesionistas, organizacion_social: @participacion_social.organizacion_social }
    assert_redirected_to participacion_social_path(assigns(:participacion_social))
  end

  test "should destroy participacion_social" do
    assert_difference('ParticipacionSocial.count', -1) do
      delete :destroy, id: @participacion_social
    end

    assert_redirected_to participacion_sociales_path
  end
end
