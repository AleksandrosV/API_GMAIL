# frozen_string_literal: true

require 'client-api'
require 'rspec'
require 'json'
require 'yaml'
require 'mail'
require 'base64'
require 'pry'
require 'simplecov'
SimpleCov.start do
  track_files '/spec/*.rb'
end
SimpleCov.add_filter ['shared_context']


ClientApi.configure do |config|
  env_data = YAML.load_file('config/env.yml')
  config.base_url = env_data[:url]
  token = YAML.load_file('token.yaml')
  access_token = token['default'].split(/, */)[1].split(/: */)[1].delete_prefix('"').delete_suffix('"')
  config.headers = { 'Content-Type' => env_data[:content_type], 'Authorization' => 'Bearer ' + access_token }
  config.json_output = { 'Dirname' => './output', 'Filename' => 'response' }
  config.time_out = 10  # in secs
  config.logger = { 'Dirname' => './logs', 'Filename' => 'test', 'StoreFilesCount' => 2 }
  config.before(:each) do
    @api = ClientApi::Api.new
    @mail = Mail.new
  end
end
