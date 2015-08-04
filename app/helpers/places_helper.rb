module PlacesHelper
  def like_button(place)
    if user_signed_in?
      btn_classes = "btn"
      if current_user.like? place
        method =  :delete
        btn_classes += " liked"
      else
        method = :post
      end
      button_to places_like_path(place), method: method, class: btn_classes,
        form: {id: "like-#{place.id}"}, remote: true do
        glyphicon :heart, place.likes.size
      end
    else
      content_tag :div ,glyphicon(:heart, place.likes.size), class: "btn button_to"
    end
  end

  def glyphicon(icon, text_label)
      "<span class='glyphicon glyphicon-#{icon}'></span> #{text_label}".html_safe
  end
end
