get '/' do
  erb :index
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
    if @user
      give_session
      redirect '/rate'
    else
      redirect '/'
    end
end

get '/signup' do

erb :signup
end

post '/signup' do
  @user = User.new(params)
  if @user.save
    give_session
    redirect '/rate'
  else
    redirect '/signup'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/rate' do
  @user = current_user
  @rate_data = get_random_user_and_question(@user)
  session[:sampled_user_id] = @rate_data[:sampled_user_id]
  session[:question_id] = @rate_data[:question_id]
  erb :rate
end

get '/profile' do
  erb :profile
end

post '/rate' do
  @user = current_user
  new_vote = Vote.new(voter_id: @user.id,
                      voted_on_id: session[:sampled_user_id],
                      property_id: session[:question_id],
                      value: params[:slider_points])
  if new_vote.save
    if request.xhr?
      @rate_data = get_random_user_and_question(@user)
      session[:sampled_user_id] = @rate_data[:sampled_user_id]
      session[:question_id] = @rate_data[:question_id]
      erb :rate, layout: false
    end
  else
    redirect '/rate'
  end
end
