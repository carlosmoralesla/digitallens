class HistoryClient < ApplicationRecord
	belongs_to :client


  def str_past_lent_type
    @lent_type = LentType.where('id = ?', self.past_lent_type_id ).first
    return @lent_type.name
  end

  def str_current_lent_type
    @lent_type = LentType.where('id = ?', self.current_lent_type_id ).first
    return @lent_type.name
  end

  
############################################
 
  def str_consult_date
    return date_consult.strftime("%d/%m/%Y %I:%M %p")
  end
##################################################

  #PAGINACION = 10
  self.per_page = 10

##################################################


end
