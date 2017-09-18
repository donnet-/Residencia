class BancoProyecto < ActiveRecord::Base
  belongs_to :empresa
  has_many :anteproyectos
  has_many :banco_proyecto_estudiantes
  accepts_nested_attributes_for :banco_proyecto_estudiantes
    
  validates :fk_rfc_emp_inst, :presence => { :message => "no puede quedar en blanco" },
                rfc_format: true
  
  validates :nombre_proyecto_b, :presence => { :message => "no puede quedar en blanco" },
                length: { maximum: 250, message: "no debe contener más de 250 caracteres" }
  
  validates :descrip_proyecto_b, :presence => { :message => "no puede quedar en blanco" },
                length: { maximum: 500, message: "no debe contener más de 500 caracteres" }
  
  validates :tipo_proyecto_b, :presence => { :message => "no puede quedar en blanco" },
                length: { maximum: 30, message: "no debe contener más de 30 caracteres" }
  
  validates_date :fecha_inicio_proyecto_b, :presence => { :message => "no puede quedar en blanco" }
  
  validates_date :fecha_termino_proyecto_b,:presence => { :message => "no puede quedar en blanco" },
                :on_or_after => :fecha_inicio_proyecto_b,
                :on_or_after_message => "Debe ser posterior a la fecha de inicio" 
  
  validates :num_residentes,:presence => { :message => "no puede quedar en blanco" },
                length: { maximum: 2, message: "no debe contener más de 2 numeros" },
                numericality: { only_integer: true, message: "debe ser un número" }
  
  validates :objetivo_esperado, :presence => { :message => "no puede quedar en blanco" },
                length: { maximum: 500, message: "no debe contener más de 500 caracteres" }
  
  def method_info_banco
    " #{self.id}"
  end
end
