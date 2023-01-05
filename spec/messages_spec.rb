# frozen_string_literal: true

require 'spec_helper'
require_relative '../shared_context/api_spec_helper'

RSpec.describe 'Messages' do
  include ApiSpecHelper
  it 'Verifies messages list.' do
    @api.get('messages')
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  it 'Verifies message info by ID.' do
    id = sample_message_id
    @api.get("messages/#{id}")
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  it 'Verifies modify message ny ID.' do
    id = sample_message_id
    @api.post("messages/#{id}/modify", { "removeLabelIds": ['IMPORTANT'] })
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  it 'Verifies batch modify message by ID.' do
    id = sample_message_id
    @api.post('messages/batchModify', { "removeLabelIds": ['IMPORTANT'], "ids": ["#{id}"] })
    expect(@api.status).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.code).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.message).to eq(ApiSpecHelper::NO_CONTENT)
  end

  it 'Verifies batch delete message by ID.' do
    id = sample_message_id
    @api.post('messages/batchDelete', { "ids": ["#{id}"] })
    expect(@api.status).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.code).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.message).to eq(ApiSpecHelper::NO_CONTENT)
  end

  it 'Verifies deleting message by ID.' do
    id = sample_message_id
    @api.delete("messages/#{id}")
    expect(@api.status).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.code).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.message).to eq(ApiSpecHelper::NO_CONTENT)
  end
end
