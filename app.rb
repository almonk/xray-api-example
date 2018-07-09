require 'dotenv/load'
require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'

get '/' do
  response = HTTParty.get "https://xray.herokai.com/projects/everyone.json", {
    headers: {"Authorization" => "Token #{ENV['XRAY_AUTH_TOKEN']}"}
  }

  @body = JSON.parse(response.body)

  erb :index
end