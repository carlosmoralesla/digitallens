module ApplicationHelper
  
##########################################
  
  def bootstrap_class_for flash_type
	   { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

#########################################

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, 'x'.html_safe, class: "close", data: { dismiss: 'alert' })
          concat message
      end)
    end
	nil
  end

#########################################

  def full_title(page_title)
    base_title = "Digital Lens"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
   end

#########################################

  def javascript(*files) #Jalar JS al HEAD
    content_for(:head) {javascript_include_tag(*files)}
  end

############################################

  def stylesheet(*files) #Jalar CSS al HEAD
    content_for(:head) {stylesheet_link_tag(*files)}
  end

############################################

  def calendar_date_select_style(*files) #JALAR Calendar
    content_for(:head) {calendar_date_select_includes(*files)}
  end

##########################################

  def jquery_validationengine(form_id) #Ejecutar el Validador, recibe el ID del Form a Validar
    concat("\n<script type='text/javascript'>\n".html_safe)
    concat("\t$jq = jQuery.noConflict();\n".html_safe)
    concat("\t$jq(document).ready(function() {\n".html_safe)
    concat("\t$jq('##{form_id}').validationEngine();\n".html_safe)
    concat("\t})\n".html_safe)
    concat("</script>".html_safe)
  end
###########################################3


end
