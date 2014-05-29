helpers do

  def give_session
    session[:user_id] = @user.id
  end

  def current_user
    user = User.find_by_id(session[:user_id])
  end
end
