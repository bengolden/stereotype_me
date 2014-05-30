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

post '/signup' do
  @user = User.new(params)
  if @user.save
    give_session
    redirect '/rate'
  else
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/rate' do
  @user = current_user
  @rate_data = get_random_user_and_question(@user)
  erb :rate
end

get '/profile' do
  erb :profile
end

post '/rate' do
  @user = current_user
  new_vote = Vote.new(voter_id: @user.id,
                      voted_on_id: params[:user_id],
                      property_id: params[:question_id],
                      value: params[:slider_points])
  if new_vote.save
    if request.xhr?
      @rate_data = get_random_user_and_question(@user)
      erb :rate
    end
  else
    redirect '/rate'
  end
end

get '/leaderboard' do
  @properties = Property.all
  @users = User.all
  erb :leaderboard
end
