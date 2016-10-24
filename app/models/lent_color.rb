class LentColor < ApplicationRecord
	has_many :lent_serials
	validates :name, uniqueness: { case_sensitive: true }
##################################################

  #PAGINACION = 10
  self.per_page = 10

##################################################
	
end
