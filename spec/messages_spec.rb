# frozen_string_literal: true

require 'spec_helper'
require_relative '../shared_context/api_spec_helper'

RSpec.describe 'Messages' do
  xit 'Verifies messages list.' do
    @api.get('messages')
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  xit 'Verifies message info by ID.' do
    @api.get('messages/1852ad9ea884f284')
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  it 'Verifies modify message ny ID.' do
    @api.post('messages/1852ad9c18397ad6/modify', { "removeLabelIds": ['IMPORTANT'] })
    expect(@api.status).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.code).to eq(ApiSpecHelper::VALID_RESPONSE_CODE)
    expect(@api.message).to eq(ApiSpecHelper::SUCCESS)
  end

  xit 'Verifies batch modify message by ID.' do
    @api.post('messages/batchModify', { "removeLabelIds": ['IMPORTANT'], "ids": ['1852ad9ea884f284'] })
    expect(@api.status).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.code).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.message).to eq(ApiSpecHelper::NO_CONTENT)
  end

  xit 'Verifies batch delete message by ID.' do
    @api.post('messages/batchDelete', { "ids": ['1852adb68775df87'] })
    expect(@api.status).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.code).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.message).to eq(ApiSpecHelper::NO_CONTENT)
  end

  xit 'Verifies deleting message by ID.' do
    @api.delete('messages/1852ad9ea884f284')
    expect(@api.status).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.code).to eq(ApiSpecHelper::NO_CONTENT_SUCCESS)
    expect(@api.message).to eq(ApiSpecHelper::NO_CONTENT)
  end
end
