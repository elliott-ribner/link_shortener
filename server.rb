require 'sinatra'
require 'pry'
#initial visit to page
get "/create_link" do
  erb :create_link
end
#redirect to create link, this time create link is populated with short url variable
#short url variable is from long url
post "/create" do
  long_url = params[:long_url_name]
  short_url = shorten_link ( long_url )
  erb :create_link , locals: { short_url: short_url }
end
#this peice is for turning long url into short url
get "/sl/:short_link_input" do
  short_url = params[:short_link_input]
  long_url = extend_link ( short_url )
  redirect "http://www.google.com" #this will be rediret to long url
end

def shorten_link long_url
  long_url.reverse
end

def extend_link short_url
 short_url.reverse
end
