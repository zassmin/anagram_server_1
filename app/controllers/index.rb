get '/' do
  erb :index
end

post "/" do
  redirect "/#{params[:user_input]}"
end

get "/*" do
  input = params[:splat].first
  @anagram = Word.anagram(input)
  if @anagram
    @anagram
  end
  erb :index
end