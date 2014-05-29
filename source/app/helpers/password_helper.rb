helpers do
  def verify_passwords(password, password_confirmation)
    password == password_confirmation
  end

  def current_user
    return nil if session[:user_id].nil?
    @user ||= User.find(session[:user_id])
  end
end
