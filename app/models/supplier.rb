class Supplier < ApplicationRecord
	belongs_to :type_doc
	validates :num_doc, uniqueness: true
##################################################

  #PAGINACION = 10
  self.per_page = 10

##################################################

end
