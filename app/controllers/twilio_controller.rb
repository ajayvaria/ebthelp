class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def notify    
    # client = Twilio::REST::Client.new 'AC8bc6be9d3302516ef8ee223f3a52d9dd', 'b52a435e5ff68118ccdc0f65ad775710'
    # message = client.messages.create from: '+16503997911', to: '+17813083441', body: 'Learning to send SMS you are!!!'
    
    results = FoodLocation.near(params['Body'], 1)[0..4]

    message = results.length > 0 ? results.collect{|r| "#{r.clean_name} - #{r.address} (" + sprintf("%.2f mi", r.distance) + ")"}.join("\n") : "No results"
    
    twiml = Twilio::TwiML::Response.new do |r|
        r.Message message
    end

    render text: twiml.text
  end
end
