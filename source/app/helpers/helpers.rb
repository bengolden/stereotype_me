helpers do

  def give_session
    session[:user_id] = @user.id
  end

  def current_user
    user = User.find_by_id(session[:user_id])
  end

  def get_random_user_and_question(user)
    @possible_users = (User.all-[user])
    @sampled_user = @possible_users.sample
    @sampled_question = Property.all.sample
  end
end
