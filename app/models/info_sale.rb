class InfoSale < ApplicationRecord
	belongs_to :sale
	belongs_to :lent_serial

##################################################

  #PAGINACION = 10
  self.per_page = 10

##################################################

end
