# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::UniversitiesController, type: :controller do
  describe "GET #index" do
    let!(:university) { create_list(:university, 2) }
    context "when universities exist" do
      it "returns a list of universities" do
        get :index
        expect(response).to have_http_status(:success)
        expect(response.body).to eq(university.to_json)
        expect(response.parsed_body.count).to eq(2)
      end
    end
    context "when no universities exist" do
      before { University.destroy_all }
      it "returns an empty array" do
        get :index
        expect(response).to have_http_status(:success)
        expect(response.parsed_body).to eq([])
      end
    end
  end

  describe "GET #show" do
    let(:university) { create(:university) }

    context 'when the university exists' do
      it "returns an university" do
        get :show, params: { id: university.id }

        expect(response).to have_http_status(:success)
        expect(response.body).to eq(university.to_json)
      end
    end

    context 'when the university does not exist' do
      it 'returns a 404 error with a not found message' do
        get :show, params: { id: 99999 }

        expect(response).to have_http_status(:not_found)
        expect(response.parsed_body).to eq({ 'error' => 'University not found' })
      end
    end
  end

  describe "POST #create" do
    context "valid parameters" do
      let(:valid_attributes) { attributes_for(:university) }

      it "should create a new university" do
        expect {
          post :create, params: { university: valid_attributes }
        }.to change(University, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(response.parsed_body['name']).to eq(valid_attributes[:name])
      end
    end

    context "invalid parameters" do
      let(:invalid_university) { build(:university, name: nil) }

      it "should not create a new university" do
        post :create, params: { university: invalid_university.attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH #update" do
    let!(:existing_university) { create(:university) }

    context "valid parameters" do
      it "should update an existing university" do
        new_name = "Updated University"

        patch :update, params: { id: existing_university.id, university: { name: new_name } }
        existing_university.reload

        expect(response).to have_http_status(:success)
        expect(existing_university.name).to eq(new_name)
      end
    end

    context "invalid parameters" do
      it "should not update the university" do
        patch :update, params: { id: existing_university.id, university: { name: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:existing_university) { create(:university) }

    it "should delete the university" do
      expect {
        delete :destroy, params: { id: existing_university.id }
      }.to change(University, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
