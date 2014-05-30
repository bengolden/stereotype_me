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
    # @sampled_user_id = @sampled_user.id
    # @sampled_question_id = @sampled_question.id
    {
    question: @sampled_question.question,
    sampled_user_id: @sampled_user.id,
    question_id: @sampled_question.id,
    endpoint1: @sampled_question.endpoint1,
    endpoint2: @sampled_question.endpoint2,
    image_url: @sampled_user.image_url
  }
  end
end
