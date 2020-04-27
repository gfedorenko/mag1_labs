require 'rails_helper'

RSpec.describe 'Databases API' do
  let!(:databases) { create_list(:database, 20) }
  let(:id) { databases.first.id }

  describe 'GET /databases/' do
    before { get "/databases", params: {} }

    context 'when todo exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all todo items' do
        expect(json.size).to eq(20)
      end
    end
  end

  describe 'GET /databases/:id' do
    before { get "/databases/#{id}", params: {} }

    context 'when databases exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when database does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Database with/)
      end
    end
  end

  describe 'POST /databases' do
    let(:valid_attributes) { { name: 'NewDatabase' } }

    context 'when request attributes are valid' do
      before do
        post "/databases", params: valid_attributes
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/databases", params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /databases/:id' do
    let(:valid_attributes) { { name: 'UpdatedName' } }

    before do
      put "/databases/#{id}", params: valid_attributes
    end

    context 'when item exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_item = Database.find(id)
        expect(updated_item.name).to match(/UpdatedName/)
      end
    end

    context 'when item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Database with/)
      end
    end
  end

  describe 'DELETE /databases' do
    before { delete "/databases/#{id}", params: {}}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end