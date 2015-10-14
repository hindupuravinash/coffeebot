require 'httparty'
require 'json'
requrie 'date'

def post_message author, quote
  img = ENV["IMAGE_URL"] || "https://libcom.org/files/images/library/fist.jpg"
  HTTParty.post SLACK_WEBHOOK, body: {"text" => quote, "username" => author, "icon_url" => img}.to_json, headers: {'content-type' => 'application/json'}
end


unless ['Saturday', 'Sunday'].include? Date.today.strftime('%A')
  SLACK_WEBHOOK = ENV["SLACK_WEBHOOK"]
  
  post_message(ENV["BOT_NAME"], ENV["MESSAGE"])
end
