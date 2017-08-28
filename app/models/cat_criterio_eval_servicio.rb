class CatCriterioEvalServicio < ActiveRecord::Base
		validates :nombre_criterio, presence: {message: "Se requiere el nombre del criterio"}

end
