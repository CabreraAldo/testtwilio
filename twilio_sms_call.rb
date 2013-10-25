require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

configure :development do
  set :bind, '0.0.0.0'
  set :port, 3000
end

post '/sms-quickstart' do
      session["counter"] ||= 0
      sms_count = session["counter"]
      thefrom = params['From']
      thebody = params['Body']
      
      #if sms_count == 0
      if File.exists?(thefrom+'.out')
        
        message = "Thanks for the status update, we will keep you updated with more information"
        database = "Status: " + thebody 
        
      else
        message = "Hello " + thebody + ", What is your Status."
        database = thebody + " " + thefrom
      end
      
      twiml = Twilio::TwiML::Response.new do |r|
        r.Sms message
        r.Say " This is the W P Carey Business Contunity Team, What is your status?"
        open(thefrom+'.out', 'a') { |f|
          f.puts database
          }
      end
      
      #end
      session["counter"] += 1
      twiml.text
 end


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