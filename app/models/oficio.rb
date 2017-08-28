class Oficio < ActiveRecord::Base
	has_many :oficio_externos
    accepts_nested_attributes_for :oficio_externos, allow_destroy: true
end