# Homepage (Root path)
enable :sessions

get '/' do
  @songs = Song.all
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/tracks' do
  erb :'songs/tracks'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/details'
end

get '/user_login/index' do
  erb :'user_login/index'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    author: params[:author],
    url:  params[:url]
  )
  if @song.save
    redirect '/'
  else
    erb :'songs/tracks'
  end
end

post '/login' do
  @user = Userlogin.find_by(username: params[:username])

  if @user
    if @user.password == params[:password]
      session[:user] = @user
    end
  else
    session[:user] = Userlogin.create(username: params[:username], password: params[:password])
  end

  redirect '/'
end

post '/logout' do

  session[:user] = nil
  redirect '/'
end

