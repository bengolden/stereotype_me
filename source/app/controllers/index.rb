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
  @user = User.new(email: params[:email], password: params[:password])
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
  erb :rate
end

get '/profile' do

end
