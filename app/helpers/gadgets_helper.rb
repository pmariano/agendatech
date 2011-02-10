module GadgetsHelper
  def eu_vou evento

    content = "<div class='gadget_vou'>"

    if user_signed_in?
      if current_user.vai_no? evento
        content << link_to('Confirmado!', root_path, :class => 'ajax_vou_confirmado')
      else
        content << link_to( 'Eu vou!', gadgets_path(:evento => evento.id, :tipo => Gadget.tipos[:eu_vou]), :class => 'ajax_vou', :id => "ajax_vou_#{evento.id}", :remote => true     )   
      end  
    else
      content << link_to( 'Eu vou!', gadgets_path(:evento => evento.id, :tipo => Gadget.tipos[:eu_vou]), :class => 'ajax_vou', :id => "ajax_vou_#{evento.id}"    )   
    end

    content << "</div>"
    content.html_safe
  end

  def user_name gadget
    User.find(gadget.user_id).nickname
  end

  def extension gadget
    image = User.find(gadget.user_id).image
    image.match(/(\w{3,4})$/).to_s
  end
    
end
