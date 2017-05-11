require 'rails_helper'

RSpec.describe Admin::RequestTypesController, type: :controller do

  before :each do
    @user = create(:user, is_admin: true)
    sign_in @user
  end

  describe 'GET #new' do
    it 'assigns a new request_type as @request_type' do
      get :new, params: {}
      expect(assigns(:request_type)).to be_a_new(RequestType)
    end

    it 'redirects non-admin Users to the root_url' do
      sign_out @user
      sign_in create(:user, is_admin: false)

      get :new, params: {}

      expect(response).to redirect_to(root_url)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested request_type as @request_type' do
      request_type = create(:request_type)
      get :edit, params: {id: request_type.to_param}
      expect(assigns(:request_type)).to eq(request_type)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      before(:each) do
        @valid_attributes = { name: 'RequestTypeName'}
      end

      it 'creates a new request_type' do
        expect {
          post :create, params: {request_type: @valid_attributes}
        }.to change(RequestType, :count).by(1)
      end

      it 'assigns a newly created request_type as @request_type' do
        post :create, params: {request_type: @valid_attributes}
        expect(assigns(:request_type)).to be_a(RequestType)
        expect(assigns(:request_type)).to be_persisted
      end
    end

    context 'with invalid params' do
      before(:each) do
        allow_any_instance_of(RequestType).to receive(:save).and_return(false)
      end

      it 'assigns a newly created but unsaved request_type as @request_type' do
        post :create, params: {request_type: build(:request_type).attributes}
        expect(assigns(:request_type)).to be_a_new(RequestType)
      end

      it 're-renders the "new" template' do
        post :create, params: {request_type: build(:request_type).attributes}
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      before(:each) do
        @valid_attributes = build(:request_type).attributes
      end

      it 'updates the requested request_type' do
        request_type = create(:request_type, name: 'OldRequestTypeName')
        put :update, params: {id: request_type.to_param, request_type: {name: 'NewRequestTypeName'} }
        request_type.reload

        expect(request_type.name).to eq('NewRequestTypeName')
      end

      it 'assigns the requested request_type as @request_type' do
        request_type = create(:request_type)
        put :update, params: {id: request_type.to_param, request_type: @valid_attributes}
        expect(assigns(:request_type)).to eq(request_type)
      end
    end

    context 'with invalid params' do
      before(:each) do
        allow_any_instance_of(RequestType).to receive(:save).and_return(false)
      end

      it 'assigns the request_type as @request_type' do
        request_type = create(:request_type)
        put :update, params: {id: request_type.to_param, request_type: build(:request_type).attributes}
        expect(assigns(:request_type)).to eq(request_type)
      end

      it 're-renders the "edit" template' do
        request_type = create(:request_type)
        put :update, params: {id: request_type.to_param, request_type: build(:request_type).attributes}
        expect(response).to render_template('edit')
      end
    end
  end
end
