require 'httparty'
require 'json'

def post_message author, quote
  img = ENV["IMAGE_URL"] || "https://libcom.org/files/images/library/fist.jpg"
  HTTParty.post SLACK_WEBHOOK, body: {"text" => quote, "username" => author, "icon_url" => img}.to_json, headers: {'content-type' => 'application/json'}
end

SLACK_WEBHOOK = ENV["SLACK_WEBHOOK"]

post_message(ENV["BOT_NAME"], ENV["MESSAGE"])
