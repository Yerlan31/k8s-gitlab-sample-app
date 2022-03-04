require 'rubygems'
require 'bundler'

Bundler.require

class Post < ActiveRecord::Base
  def to_s
    "#{body} #{created_at}"
  end
end

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/posts' do
  erb :posts
end

post '/posts' do
  Post.create(params)
  redirect '/posts'
end

__END__

@@ layout
<html>
  <head>
    <title>Sample App</title>
  </head>
  <body>
    <h1>Sample App</h1>
    <a href="/">index</a>
    <a href="/about">about</a>
    <a href="/posts">posts</a>
    <%= yield %>
  </body>
</html>

@@ index
<h2>Index</h1>

@@ about
<h2>About</h2>
<% ENV.each do |var,val| %>
  <p><%= var %>: <%= val %></p>
<% end %>

@@ posts
<h2>Posts</h2>
<% Post.all.each do |post| %>
  <p><%= post.to_s %></p>
<% end %>
<form action="/posts" method="POST">
  <input name="body">
  <input type="submit">
</form>
