class Solicitud < ActiveRecord::Base
  has_many :solicitud_observaciones
  accepts_nested_attributes_for :solicitud_observaciones, allow_destroy: true
  
  validates :nombrep, :presence => { :message => "No puede quedar en blanco" }
  
  validates_date :fechaini, :presence => { :message => "No puede quedar en blanco" },
                :on_or_after => lambda { Date.today },
                :on_or_after_message => "Debe ser la fecha de hoy o posterior"
      
  validates_date :fechater,:presence => { :message => "No puede quedar en blanco" },
                :on_or_after => :fecha_inicio_proyecto_b,
                :on_or_after_message => "Debe ser posterior a la fecha de inicio" 
  
  validates :rfc, :presence => { :message => "No puede quedar en blanco" },
                rfc_format: true
  
  validates :aexterno, :presence => { :message => "No puede quedar en blanco" }
  
  validates :telefono, length: { maximum: 10, message: "No debe tener más de 10 dígitos" }
  
  validates :correo, :email_format => { :message => "Debe cumplir con el formato para correo" }
  
  validates :area, :presence => { :message => "No puede quedar en blanco" }
  
  validates :numresidentes, numericality: { only_integer: true, message: "Debe ser un número" },
      length: { maximum: 2, message: "No debe tener más de 2 dígitos" }
  
  validates :carrera, :presence => { :message => "No puede quedar en blanco" }
  
  validates :semestre, numericality: { only_integer: true, message: "Debe ser un número" },
      length: { maximum: 2, message: "No debe tener más de 2 dígitos" }
  
  validates :ingles, :presence => { :message => "No puede quedar en blanco" }
  
  validates :horaentrada, presence: {message: "No puede quedar en blanco"}, format: {with: /\A([0-1][0-9]|2[0-4]):[0-5][0-9]\z/, message: "No cumple con el formato (HH:MM) o no es una hora posible"}
  
  validates :horasalida, presence: {message: "No puede quedar en blanco"}, format: {with: /\A([0-1][0-9]|2[0-4]):[0-5][0-9]\z/, message: "No cumple con el formato (HH:MM) o no es una hora posible"}
  
  validates :desproyecto, :presence => { :message => "No puede quedar en blanco" },
                length: { maximum: 500, message: "no debe contener más de 500 caracteres" }
  
  validates :objetivo, :presence => { :message => "No puede quedar en blanco" },
                length: { maximum: 500, message: "No debe contener más de 500 caracteres" }
  
  validates :actividades, :presence => { :message => "No puede quedar en blanco" },
                length: { maximum: 500, message: "No debe contener más de 500 caracteres" }
  
  validates :pc, :presence => { :message => "No puede quedar en blanco" }
  
  validates :tel_escritorio, :presence => { :message => "No puede quedar en blanco" }
  
  validates :lugar, :presence => { :message => "No puede quedar en blanco" }
  
  validates :beca, numericality: { only_integer: true, message: "Debe ser un número" }
end
