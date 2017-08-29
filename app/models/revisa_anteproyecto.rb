class RevisaAnteproyecto < ActiveRecord::Base
  belongs_to :anteproyecto
  belongs_to :docente
end
