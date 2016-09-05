require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"


get "/" do
  @files = Dir.glob("public/*").map! { |file| File.basename(file) }
  @title = "Public Directory Listing"
  @files.reverse! if params[:sort] == "decending"
  erb :home
end
