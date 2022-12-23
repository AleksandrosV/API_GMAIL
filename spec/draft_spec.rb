# frozen_string_literal: true

require 'spec_helper'
require_relative '../shared_context/api_spec_helper'

RSpec.describe 'Drafts' do
  it 'Verifies creating draft.' do
    @mail.from =     'testapiruby@gmail.com'
    @mail.to =       'testapiruby@gmail.com'
    @mail.subject =  'Draft test'
    @mail.body =     'This is a draft.'
    raw = Base64.urlsafe_encode64 @mail.to_s
    @api.post('drafts', { "message": { "raw": raw } })
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  xit 'Verifies drafts list.' do
    @api.get('drafts')
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  xit 'Verifies draft info by ID.' do
    @api.get('drafts/r-3174054064523648512')
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  xit 'Verifies deleting draft by ID.' do
    @api.delete('drafts/r-3159211704065235853')
    expect(@api.status).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.code).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.message).to eq(ApiSpecHelper::NO_CONTENT)
  end
end