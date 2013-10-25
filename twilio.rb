require 'rubygems'
require 'twilio-ruby'
 
account_sid = "AC5f6c9f7bf9ccde16e207ce5f101b7734"
auth_token = "5c85799c4666197ff47fd410d1fbbaa7"
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "+1917-563-4548" # Your Twilio number
 


@client = Twilio::REST::Client.new account_sid, auth_token
 
@call = @client.account.calls.create(
  :from => from,   # From your Twilio number
  :to => '+19147557211',     # To any number
  # Fetch instructions from this URL when the call connects
  :url => 'http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient'
)