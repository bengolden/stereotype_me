get '/' do
  erb :index
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
    if @student
      give_session
      redirect '/dashboard'
    else
      redirect '/'
    end
end

get '/dashboard' do
  @user = current_user
  erb :dashboard
end

post '/signup' do
  @user = User.new(email: params[:email], password: params[:password])
  if @user.save
    give_session
    redirect '/'
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
  erb :rate
end

get '/profile' do

end
