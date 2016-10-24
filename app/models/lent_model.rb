class LentModel < ApplicationRecord
	belongs_to :lent_mark

	has_many :lent_serials
	validates :name, uniqueness: { case_sensitive: true }
##################################################

  #PAGINACION = 10
  self.per_page = 10

##################################################
	
end
