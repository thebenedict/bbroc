module AvatarHelper
  def avatar_or_default(user)
    if user.hosted_avatar_url.present?
      user.hosted_avatar_url
    else
      image_url("user-icon.png")
    end
  end
end