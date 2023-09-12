# frozen_string_literal: true

# Module for Api specs variables and methods
module ApiSpecHelper
  VALID_RESPONSE_CODE = 200
  NO_CONTENT_SUCCESS = 204
  INVALID_RESPONSE_CODE = 400
  SUCCESS = 'OK'
  BAD_REQUEST = 'Bad Request'
  NO_CONTENT = 'No Content'
  STANDARD_LABEL_IDS = ['CHAT', 'SENT', 'INBOX', 'IMPORTANT', 'TRASH', 'DRAFT', 'SPAM', 'CATEGORY_FORUMS', 'CATEGORY_UPDATES', 'CATEGORY_PERSONAL', 'CATEGORY_PROMOTIONS', 'CATEGORY_SOCIAL', 'STARRED', 'UNREAD'].freeze

  def sample_draft_id
    @api.get('drafts')
    @api.body['drafts'].sample['id']
  end

  def sample_message_id
    @api.get('messages')
    @api.body['messages'].sample['id']
  end

  def sample_label_id
    @api.get('labels')
    @api.body['labels'].map { |l| l['id'] if !STANDARD_LABEL_IDS.include? l['id'] }.compact!.sample
  end
end
