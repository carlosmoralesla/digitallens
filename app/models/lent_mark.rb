class LentMark < ApplicationRecord
	has_many :lent_models
	validates :name, uniqueness: { case_sensitive: true }
##################################################

  #PAGINACION = 10
  self.per_page = 10

##################################################
	
end
