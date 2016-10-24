class Sale < ApplicationRecord
  
  belongs_to :client
  

  has_many :info_sales
  accepts_nested_attributes_for :info_sales, :allow_destroy => true,  :reject_if => proc { |att| att['price_sale'].blank? }
  
  has_many :accesory_sales
  accepts_nested_attributes_for :accesory_sales, :allow_destroy => true,  :reject_if => proc { |att| att['price_sale'].blank? }

  validates :num_sale, uniqueness: { case_sensitive: true }
  
############################################
 
  def str_created_at
    return created_at.strftime("%d/%m/%Y %I:%M %p")
  end
##################################################

  #PAGINACION = 10
  self.per_page = 10

##################################################

end
