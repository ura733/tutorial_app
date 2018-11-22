require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'users page'do
    it 'access successflly' do
      get signup_path
      expect(response).to have_http_status(:success)
    end
  end
end
