# frozen_string_literal: true

require 'spec_helper'
require 'securerandom'
require_relative '../shared_context/api_spec_helper'

RSpec.describe 'Labels' do
  include ApiSpecHelper
  it 'Verifies creating label.' do
    random_string = SecureRandom.hex
    @api.post('labels', { "labelListVisibility": 'labelShow', "messageListVisibility": 'show', "name": "#{random_string}" })
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  it 'Verifies labels list.' do
    @api.get('labels')
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  it 'Verifies label info by ID.' do
    id = sample_label_id
    @api.get("labels/#{id}")
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  it 'Verifies deleting label by ID.' do
    id = sample_label_id
    @api.delete("labels/#{id}")
    expect(@api.status).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.code).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.message).to eq(ApiSpecHelper::NO_CONTENT)
  end

  it 'Verifies change labels name.' do
    id = sample_label_id
    random_string = SecureRandom.hex
    @api.patch("labels/#{id}", { "name": "#{random_string}" })
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  it 'Verifies update labels.' do
    id = sample_label_id
    random_string = SecureRandom.hex
    @api.put("labels/#{id}", { "id": "#{id}", "labelListVisibility": 'labelShow', "messageListVisibility": 'show', "name": "#{random_string}" })
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end
end
