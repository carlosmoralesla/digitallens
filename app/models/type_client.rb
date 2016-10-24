class TypeClient < ApplicationRecord
	has_many :type_docs
	validates :name, uniqueness: { case_sensitive: true }
##################################################

  #PAGINACION = 10
  self.per_page = 10

##################################################

end
