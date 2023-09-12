# frozen_string_literal: true

require 'spec_helper'
require_relative '../shared_context/api_spec_helper'

RSpec.describe 'Drafts' do
  include ApiSpecHelper
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

  it 'Verifies drafts list.' do
    @api.get('drafts')
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  it 'Verifies draft info by ID.' do
    id = sample_draft_id
    @api.get("drafts/#{id}")
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  it 'Verifies deleting draft by ID.' do
    id = sample_draft_id
    @api.delete("drafts/#{id}")
    expect(@api.status).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.code).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.message).to eq(ApiSpecHelper::NO_CONTENT)
  end
end
