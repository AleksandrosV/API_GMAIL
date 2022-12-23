# frozen_string_literal: true

module ApiSpecHelper
  VALID_RESPONSE_CODE = 200
  NO_CONTENT_SUCCESS = 204
  INVALID_RESPONSE_CODE = 400
  SUCCESS = 'OK'
  BAD_REQUEST = 'Bad Request'
  NO_CONTENT = 'No Content'

  def sample_draft_id
    @api.get('drafts')
    @api.body["drafts"].sample["id"]
  end
end
