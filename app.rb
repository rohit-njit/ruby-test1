require 'sinatra'
class MyApp < Sinatra::Base
  get '/' do
    "<!DOCTYPE html><html><head></head><body><h1>Hello World #{session[:secret]}</h1></body></html>"
  end
  
  get '/pg' do
    erb :index
  end
  
  get '/time' do
    code = "<%= Time.now %>"
    erb code
  end
  
  get '/tp' do
    erb :index, :layout => :pg1
  end
  
  get '/red' do
    redirect to('/time')
  end
  
  enable :sessions

get '/foo' do
  session[:secret] = 'ptt'
  redirect to('/bar')
end

get '/bar' do
  session[:secret]
end

post "/api" do
  request.body.rewind  # in case someone already read it
  data = JSON.parse request.body.read
  "Hello #{data['name']}!"
end
end