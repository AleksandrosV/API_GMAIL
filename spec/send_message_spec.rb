# frozen_string_literal: true

require 'spec_helper'
require_relative '../shared_context/api_spec_helper'

RSpec.describe 'Sending Message' do
  xit 'Verifies message can be send.' do
    @mail.from =     'testapiruby@gmail.com'
    @mail.to =       'testapiruby@gmail.com'
    @mail.subject =  'Api email test'
    @mail.body =     'Hello Alex, This is a test.'
    @mail.add_file   '/Users/vuros/Documents/photo/1.jpg'
    raw = Base64.urlsafe_encode64 @mail.to_s
    @api.post('messages/send', { 'raw': raw })
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  it "Verifies wrong email credentials message can't be send." do
    @mail.from =     'testapiruby@gmail.com'
    @mail.to =       'testapirubygmail.com'
    @mail.subject =  'Api email test'
    @mail.body =     'Hello Alex, This is a test.'
    raw = Base64.urlsafe_encode64 @mail.to_s
    @api.post('messages/send', { 'raw': raw })
    expect(@api.status).to eq(ApiSpecHelper::INVALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::INVALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::BAD_REQUEST)
  end
end
