class CatDocumentosController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_cat_documento, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  def index
    @cat_documentos = CatDocumento.order(sort_column + ' ' + sort_direction).paginate( per_page: 10, page: params[:page])
  end

  def show
    @cat_documentos = CatDocumento.find(params[:id])
  end

  def new
    @cat_documento = CatDocumento.new
  end

  def edit
    @cat_documento = CatDocumento.find(params[:id])
  end

  def create
    @cat_documento = CatDocumento.new(cat_documento_params)

    respond_to do |format|
      if @cat_documento.save
        format.html { redirect_to cat_documentos_path, notice: 'El documento ha sido satisfactoriamente almacenado en el catálogo.' }
        format.json { render :index, status: :created, location: @cat_documento }
      else
        format.html { render :new }
        format.json { render json: @cat_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cat_documento.update(cat_documento_params)
        format.html { redirect_to cat_documentos_path, notice: 'El documento ha sido satisfactoriamente actualizado.' }
        format.json { render :index, status: :ok, location: @cat_documento }
      else
        format.html { render :edit }
        format.json { render json: @cat_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cat_documento.destroy
    respond_to do |format|
      format.html { redirect_to cat_documentos_url, notice: 'Cat documento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_cat_documento
      @cat_documento = CatDocumento.find(params[:id])
    end

    def cat_documento_params
      params.require(:cat_documento).permit(:nom_documento, :estado, :etapa)
    end

    def sort_column
        params[:sort] || "id"
    end
    
    def sort_direction
        params[:direction] || "desc"
    end
end
