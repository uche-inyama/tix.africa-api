require 'rails_helper'

RSpec.describe 'Events API' do
  let(:user) { create(:user) }
  let(:event) { create(:event, user_id: user.id) }
  let!(:events) { create_list(:event, 10, user_id: user.id)}

  describe 'GET /events' do
    before { get '/events' }

    it 'returns events' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(10)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /events' do
    let(:params) do {
        event: {
          start_date: 'Sunday, January 8 2022',
          end_date: 'Sunday, January 9 2022',
          time: '7:00 PM - 12:00 AM',
          address: 'xyz',
          theme: 'hello world',
          details: 'hello world',
          image_data: 'xyz',
          event_type: 'paid',
          status: 'active',
          user_id: user.id
        }
      }
    end

    before { post '/events', params: params }
    it 'creates a new book' do
      expect(response).to have_http_status(201)
    end
  end

  describe 'PUT /events/:id' do
    let(:params) do {
      event: { address: 'xyz' }
    } end
    before { put "/events/#{event.id}", params: params }
    it 'updates an event' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /events/:id' do
    before { delete "/events/#{event.id}" }
    it 'deletes an event' do
      expect(response).to have_http_status(:no_content)
    end
  end
end