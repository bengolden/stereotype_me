helpers do

  def give_session
    session[:user_id] = @user.id
  end

  def current_user
    user = User.find_by_id(session[:user_id])
  end

  def get_random_user_and_question(user)
    last_user = User.find_by_id(session[:sampled_user_id])
    last_question = Property.find_by_id(session[:question_id])
    @possible_users = (User.all-[user]-[last_user])
    @sampled_user = @possible_users.sample
    @sampled_question = (Property.all-[last_question]).sample

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
