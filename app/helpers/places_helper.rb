module PlacesHelper
  def like_button(place)
    if user_signed_in?
      method = place.likes.exists?(:user_id => current_user.id) ? :destroy : :post
      button_to places_like_path(place), method: method, class: "btn",
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
