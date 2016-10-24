class Client < ApplicationRecord

  belongs_to :type_doc
  
  has_many :history_clients
  has_many :sales

  validates :num_doc, uniqueness: true

########################################

  def str_complete_name
   
      return self.try(:name).to_s + " " + self.try(:last_name).to_s + " " + self.try(:second_surname).to_s
     
   
  end
########################################

  def str_sex
    if self.sex.to_i == 1
      return "Masculino"
    else
      return "Femenino" 	
    end
  end
##################################################

  #PAGINACION = 10
  self.per_page = 10

##################################################
end
