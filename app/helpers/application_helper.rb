module ApplicationHelper
  def current_user_is_admin?
    user_signed_in? && (current_user.has_role? :admin)
  end

  def current_user_is_mod?
    user_signed_in? && (current_user.has_role? :moderator)
  end

  def current_user_is_mod_or_admin?
    current_user_is_mod? || current_user_is_admin?
  end
end
