require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/message'

get '/' do
  @messages = Message.all
  # @message = Message.create(text: 'params[text]', urlsafe: SecureRandom.urlsafe_base64)
  # @message = 2
  erb :message_new
end

post '/message' do
  message = Message.new(text: params['text'], urlsafe: SecureRandom.urlsafe_base64)
  # message = Message.new(text: 'params[text]', urlsafe: SecureRandom.urlsafe_base64)
  if params['destruction_option'] == 'one_link_visit'
    message.visits_remaining = 1
  end
  message.save
  redirect to("/message/#{message.urlsafe}")
end

get '/message/:urlsafe' do
  @message = Message.where(urlsafe: params['urlsafe']).last
  erb :message_show
end