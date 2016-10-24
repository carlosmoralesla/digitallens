class LentSerial < ApplicationRecord
	
  belongs_to :lent_model
  belongs_to :lent_color
  belongs_to :lent_kind

  has_many :info_sales
  validates :name, uniqueness: { case_sensitive: true }
 

  def str_name_sale
    "#{name} (P.min: #{price_cost} / P.Max: #{price_shop}" 
  end

##################################################

  #PAGINACION = 10
  self.per_page = 10

##################################################
	
end
