class TypeDoc < ApplicationRecord
	belongs_to :type_client

	has_many :clients
	has_many :suppliers

	validates :name, uniqueness: { case_sensitive: true }
##################################################

  #PAGINACION = 10
  self.per_page = 10

##################################################

end
