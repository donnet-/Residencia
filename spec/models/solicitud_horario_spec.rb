require 'spec_helper'

RSpec.describe SolicitudHorario, type: :model do
  before {
    @attributes = { # Atributos válidos
                   dia_inicio: 'Lunes',
                   dia_termino: 'Viernes',
                   hora_inicio: '08:00',
                   hora_termino: '14:00',
                   solicitud_id: 3
                   }
  }
    context 'model' do
      it 'exist' do
        solicitud = SolicitudHorario.new
        expect(solicitud).to_not be_nil
      end
    end
    
    it 'is valid with all the attributes' do
      solicitud = SolicitudHorario.new @attributes
      expect(solicitud).to be_valid
    end
    
    it 'is valid if belongs to :solicitud' do
      relacion = SolicitudHorario.reflect_on_association(:solicitud)
      expect(relacion.macro).to be(:belongs_to)
    end
    
    # -------------------------------------------------------------
    
    describe '#día inicio' do
      context 'with valid data' do
        it 'accepts dia_inicio (con el formato correcto)' do
          solicitud = SolicitudHorario.new @attributes
          expect(solicitud).to be_valid
        end
      end # valid dia_inicio
      
      context 'with invalid data' do
        it 'refuses dia_inicio (en blanco)' do
          @attributes.merge!(dia_inicio: '')
          solicitud = SolicitudHorario.new @attributes
          expect(solicitud).to be_invalid
        end
      end # invalid dia_inicio
    end # dia_inicio description
    
    # -------------------------------------------------------------
    
    describe '#día término' do
      context 'with valid data' do
        it 'accepts dia_termino (con el formato correcto)' do
          solicitud = SolicitudHorario.new @attributes
          expect(solicitud).to be_valid
        end
      end # valid dia_termino
      
      context 'with invalid data' do
        it 'refuses dia_inicio (en blanco)' do
          @attributes.merge!(dia_termino: '')
          solicitud = SolicitudHorario.new @attributes
          expect(solicitud).to be_invalid
        end
      end # invalid dia_termino
    end # dia_termino description
    
    # -------------------------------------------------------------
    
    describe '#hora inicio' do
      context 'with valid data' do
        it 'accepts hora_inicio (con el formato correcto)' do
          solicitud = SolicitudHorario.new @attributes
          expect(solicitud).to be_valid
        end
      end # valid hora_inicio
      
      context 'with invalid data' do
        it 'refuses hora_inicio (en blanco)' do
          @attributes.merge!(hora_inicio: '')
          solicitud = SolicitudHorario.new @attributes
          expect(solicitud).to be_invalid
        end
      end # invalid hora_inicio
    end # hora_inicio description
    
    # -------------------------------------------------------------
    
    describe '#hora término' do
      context 'with valid data' do
        it 'accepts hora_termino (con el formato correcto)' do
          solicitud = SolicitudHorario.new @attributes
          expect(solicitud).to be_valid
        end
      end # valid hora_termino
      
      context 'with invalid data' do
        it 'refuses hora_termino (en blanco)' do
          @attributes.merge!(hora_termino: '')
          solicitud = SolicitudHorario.new @attributes
          expect(solicitud).to be_invalid
        end
        
        it 'refuses hora_termino (anterior a la hora de inicio)' do
          @attributes.merge!(hora_termino: '06:00')
          solicitud = SolicitudHorario.new @attributes
          expect(solicitud).to be_invalid
        end
      end # invalid hora_termino
    end # hora_termino description
    
    # -------------------------------------------------------------
    
end








