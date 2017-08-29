require 'test_helper'

class CompetenciasEmpresasControllerTest < ActionController::TestCase
  setup do
    @competencias_empresa = competencias_empresas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:competencias_empresas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create competencias_empresa" do
    assert_difference('CompetenciasEmpresa.count') do
      post :create, competencias_empresa: { adaptacion_cambios: @competencias_empresa.adaptacion_cambios, bueno: @competencias_empresa.bueno, comentario: @competencias_empresa.comentario, creatividad: @competencias_empresa.creatividad, cumplimiento: @competencias_empresa.cumplimiento, exelente: @competencias_empresa.exelente, facilidad_palabra: @competencias_empresa.facilidad_palabra, gestion_proyecto: @competencias_empresa.gestion_proyecto, habilidad: @competencias_empresa.habilidad, habilidad_tiempo: @competencias_empresa.habilidad_tiempo, integracion: @competencias_empresa.integracion, liderazgo: @competencias_empresa.liderazgo, malo: @competencias_empresa.malo, mejora_procesos: @competencias_empresa.mejora_procesos, muy_bueno: @competencias_empresa.muy_bueno, orotografia: @competencias_empresa.orotografia, puntualidad: @competencias_empresa.puntualidad, regular: @competencias_empresa.regular, seguridad_personal: @competencias_empresa.seguridad_personal, sugerencia_mejora: @competencias_empresa.sugerencia_mejora, trabajo_equipo: @competencias_empresa.trabajo_equipo }
    end

    assert_redirected_to competencias_empresa_path(assigns(:competencias_empresa))
  end

  test "should show competencias_empresa" do
    get :show, id: @competencias_empresa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @competencias_empresa
    assert_response :success
  end

  test "should update competencias_empresa" do
    patch :update, id: @competencias_empresa, competencias_empresa: { adaptacion_cambios: @competencias_empresa.adaptacion_cambios, bueno: @competencias_empresa.bueno, comentario: @competencias_empresa.comentario, creatividad: @competencias_empresa.creatividad, cumplimiento: @competencias_empresa.cumplimiento, exelente: @competencias_empresa.exelente, facilidad_palabra: @competencias_empresa.facilidad_palabra, gestion_proyecto: @competencias_empresa.gestion_proyecto, habilidad: @competencias_empresa.habilidad, habilidad_tiempo: @competencias_empresa.habilidad_tiempo, integracion: @competencias_empresa.integracion, liderazgo: @competencias_empresa.liderazgo, malo: @competencias_empresa.malo, mejora_procesos: @competencias_empresa.mejora_procesos, muy_bueno: @competencias_empresa.muy_bueno, orotografia: @competencias_empresa.orotografia, puntualidad: @competencias_empresa.puntualidad, regular: @competencias_empresa.regular, seguridad_personal: @competencias_empresa.seguridad_personal, sugerencia_mejora: @competencias_empresa.sugerencia_mejora, trabajo_equipo: @competencias_empresa.trabajo_equipo }
    assert_redirected_to competencias_empresa_path(assigns(:competencias_empresa))
  end

  test "should destroy competencias_empresa" do
    assert_difference('CompetenciasEmpresa.count', -1) do
      delete :destroy, id: @competencias_empresa
    end

    assert_redirected_to competencias_empresas_path
  end
end
