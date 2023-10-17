class UserAddressSerializer
  include JSONAPI::Serializer
  attributes :id, :user_id, :address, :tel_line, :tel_line2, :image_url

  def image_url
    return unless object.image.attached?

    Rails.application.routes.url_helpers.url_for(object.image)
  end
end
