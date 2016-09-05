require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'yaml'

before do
  @user_list = Psych.load_file("users.yaml")
end

helpers do
  def count_interests(users)
    # users = @user_list.keys
    sum = 0
    users.keys.each {|user| sum += users[user][:interests].count}
    sum
  end
end

get "/" do
  redirect "/users"
end

get "/users" do
 erb :users
end


get "/:user_name" do
  @user_name = params[:user_name].to_sym
  @email = @user_list[@user_name][:email]
  @interests = @user_list[@user_name][:interests]
  @remaning_users = @user_list.select { |names, _| names != @user_name }

  erb :user
end
