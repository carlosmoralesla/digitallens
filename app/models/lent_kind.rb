class LentKind < ApplicationRecord
	has_many :lent_serials
##################################################

  #PAGINACION = 10
  self.per_page = 10

##################################################
	
end
