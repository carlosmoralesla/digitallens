class LentAccesory < ApplicationRecord
  has_many :accesory_sales
##################################################

  def str_name_sale
    "#{name} (P.min: #{price_cost} / P.Max: #{price_shop}" 
  end
##################################################
  
  #PAGINACION = 10
  self.per_page = 10

##################################################

end
