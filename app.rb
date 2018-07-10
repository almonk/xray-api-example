require 'dotenv/load'
require 'sinatra'
require 'httparty'

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == ENV["DEMO_USERNAME"] and password == ENV['DEMO_PASSWORD']
end


get '/' do
  response = HTTParty.get "https://xray.herokai.com/projects/multi-cert-sso-flow.json", {
    headers: {"Authorization" => "Token #{ENV['XRAY_AUTH_TOKEN']}"}
  }

  @body = JSON.parse(response.body)

  erb :index
end