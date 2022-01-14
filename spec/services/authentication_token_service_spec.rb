require 'rails_helper'

RSpec.describe AuthenticationTokenService do
  describe '.call' do
    let(:user) { create(:user) }
    let(:token) { described_class.call(user.id)}

    it 'returns an authenticated token' do
      decoded_token = JWT.decode(
        token,
        described_class::HMAC_SECRET,
        true,
        { algorithm: described_class::ALGORITHM_TYPE }
      )
      expect(decoded_token).to eq(
        [
          {"user_id" => user.id},
          {"alg" => "HS256"}
        ]
      )
    end
  end
end