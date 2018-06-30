require 'rails_helper'

describe 'api/users', type: :request do
  let(:user) { create(:user) }
end
  describe 'GET' do
    it 'Approving response' do
      get 'api/users', headers: {'Authorization': "Bearer #{user.token}"}

      expect(response.content_type).to_eq('application.json')
      json_body = JSON.parse(response.json_body)
      expect(json_body.count).to eq(1)
      expect(json_body[0]['email']).to_eq(user.email)
      expect(json_body[0]['id']).to_eq(user.id)
    end
  end
