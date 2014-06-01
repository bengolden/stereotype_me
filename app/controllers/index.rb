get '/' do
  redirect '/rate'
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
  @active_properties = current_user.properties.distinct
  @sliders = []
  @active_properties.each do |property|
    votes_for_current_user = property.votes_for_user(current_user.id)
    total_votes = votes_for_current_user.length
    slider = votes_for_current_user.map{|vote| vote.value}.inject(:+) / total_votes
    @sliders.push(slider * 2.8 + 80)
  end
  erb :profile
end

post '/rate' do
  @user = current_user
  if @user
    new_vote = Vote.new(voter_id: @user.id,
                        voted_on_id: session[:sampled_user_id],
                        property_id: session[:question_id],
                        value: params[:slider_points])
  else
    new_vote = Vote.new(voter_id: nil,
                        voted_on_id: session[:sampled_user_id],
                        property_id: session[:question_id],
                        value: params[:slider_points])
  end
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

get '/leaderboard' do
  @properties = Property.all
  @users = User.all
  erb :leaderboard
end

get '/adm1n' do
  @users = User.all
  @votes = Vote.all
  @properties = Property.all
  @suggestions = Suggestion.all
  erb :admin
end

get '/property/new' do
  erb :new_property
end

post '/property/new' do
  user = current_user
  new_suggestion = Suggestion.new(suggestion: params[:question], endpoint1: params[:endpoint1], endpoint2: params[:endpoint2], user_id: user.id)
  if new_suggestion.save
    redirect '/rate'
  else
    redirect '/rate'
  end
end
