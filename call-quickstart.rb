require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

configure :development do
  set :bind, '0.0.0.0'
  set :port, 4000
end

require 'rubygems'
require 'sinatra'
require 'twilio-ruby'
 
get '/hello-call' do
  people = {
    '+14159350767' => 'Chris Lopez',
    '+19178816030' => 'Chris Digiacamo',
    '+19147557211' => 'Aldo',
    '+12124921100' => 'Why are you calling form the W P C office, any ways'    
    
  }

  name = people[params['From']] || 'Monkey'
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello #{name}, this is the Business Continuity Team, there is no Disaster or Update at the moment"
  end.text
end


