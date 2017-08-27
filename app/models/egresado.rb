class Egresado < ActiveRecord::Base
  belongs_to :cat_plan_curso
  belongs_to :examen_profesional
end
