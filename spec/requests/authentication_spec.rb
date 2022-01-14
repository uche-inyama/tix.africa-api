require 'rails_helper'

RSpec.describe "Authentication", type: :request do
  let!(:user) { create(:user)}
  let(:token) { AuthenticationTokenService.call(user.id)}
  describe "POST /authenticate" do

    before { post "/authenticate", params: {email: user.email, password: user.password } } 
    
    it "returns http success" do
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({'token' => token })
    end
  end
end
