require 'test_helper'

class UbicacionLaboralesControllerTest < ActionController::TestCase
  setup do
    @ubicacion_laboral = ubicacion_laborales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ubicacion_laborales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ubicacion_laboral" do
    assert_difference('UbicacionLaboral.count') do
      post :create, ubicacion_laboral: { act_dedica: @ubicacion_laboral.act_dedica, ano_ingreso: @ubicacion_laboral.ano_ingreso, anti_empleo: @ubicacion_laboral.anti_empleo, ciudad: @ubicacion_laboral.ciudad, condicion: @ubicacion_laboral.condicion, domicilio: @ubicacion_laboral.domicilio, email: @ubicacion_laboral.email, escribir_idioma: @ubicacion_laboral.escribir_idioma, escuchar_idioma: @ubicacion_laboral.escuchar_idioma, especialidad_institucion: @ubicacion_laboral.especialidad_institucion, estado: @ubicacion_laboral.estado, estudia: @ubicacion_laboral.estudia, ext: @ubicacion_laboral.ext, fax: @ubicacion_laboral.fax, giro: @ubicacion_laboral.giro, hablar_idioma: @ubicacion_laboral.hablar_idioma, idioma_trabajo: @ubicacion_laboral.idioma_trabajo, ingreso: @ubicacion_laboral.ingreso, leer_idioma: @ubicacion_laboral.leer_idioma, medio_empleo: @ubicacion_laboral.medio_empleo, municipio: @ubicacion_laboral.municipio, nivel_jerarquico: @ubicacion_laboral.nivel_jerarquico, organismo: @ubicacion_laboral.organismo, pagina_web: @ubicacion_laboral.pagina_web, razon_social: @ubicacion_laboral.razon_social, relacion: @ubicacion_laboral.relacion, requisitos_contratacion: @ubicacion_laboral.requisitos_contratacion, sector_primario: @ubicacion_laboral.sector_primario, sector_secundario: @ubicacion_laboral.sector_secundario, sector_terciario: @ubicacion_laboral.sector_terciario, tam_empresa: @ubicacion_laboral.tam_empresa, telefno: @ubicacion_laboral.telefno, tiempo_empleo: @ubicacion_laboral.tiempo_empleo }
    end

    assert_redirected_to ubicacion_laboral_path(assigns(:ubicacion_laboral))
  end

  test "should show ubicacion_laboral" do
    get :show, id: @ubicacion_laboral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ubicacion_laboral
    assert_response :success
  end

  test "should update ubicacion_laboral" do
    patch :update, id: @ubicacion_laboral, ubicacion_laboral: { act_dedica: @ubicacion_laboral.act_dedica, ano_ingreso: @ubicacion_laboral.ano_ingreso, anti_empleo: @ubicacion_laboral.anti_empleo, ciudad: @ubicacion_laboral.ciudad, condicion: @ubicacion_laboral.condicion, domicilio: @ubicacion_laboral.domicilio, email: @ubicacion_laboral.email, escribir_idioma: @ubicacion_laboral.escribir_idioma, escuchar_idioma: @ubicacion_laboral.escuchar_idioma, especialidad_institucion: @ubicacion_laboral.especialidad_institucion, estado: @ubicacion_laboral.estado, estudia: @ubicacion_laboral.estudia, ext: @ubicacion_laboral.ext, fax: @ubicacion_laboral.fax, giro: @ubicacion_laboral.giro, hablar_idioma: @ubicacion_laboral.hablar_idioma, idioma_trabajo: @ubicacion_laboral.idioma_trabajo, ingreso: @ubicacion_laboral.ingreso, leer_idioma: @ubicacion_laboral.leer_idioma, medio_empleo: @ubicacion_laboral.medio_empleo, municipio: @ubicacion_laboral.municipio, nivel_jerarquico: @ubicacion_laboral.nivel_jerarquico, organismo: @ubicacion_laboral.organismo, pagina_web: @ubicacion_laboral.pagina_web, razon_social: @ubicacion_laboral.razon_social, relacion: @ubicacion_laboral.relacion, requisitos_contratacion: @ubicacion_laboral.requisitos_contratacion, sector_primario: @ubicacion_laboral.sector_primario, sector_secundario: @ubicacion_laboral.sector_secundario, sector_terciario: @ubicacion_laboral.sector_terciario, tam_empresa: @ubicacion_laboral.tam_empresa, telefno: @ubicacion_laboral.telefno, tiempo_empleo: @ubicacion_laboral.tiempo_empleo }
    assert_redirected_to ubicacion_laboral_path(assigns(:ubicacion_laboral))
  end

  test "should destroy ubicacion_laboral" do
    assert_difference('UbicacionLaboral.count', -1) do
      delete :destroy, id: @ubicacion_laboral
    end

    assert_redirected_to ubicacion_laborales_path
  end
end
