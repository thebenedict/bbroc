module AvatarHelper
  def avatar_or_default(user)
    if user.avatar.present?
      user.avatar.url
    elsif user.hosted_avatar_url.present?
      user.hosted_avatar_url
    else
      user.avatar.url
    end
  end
end