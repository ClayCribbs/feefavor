require 'rails_helper'

RSpec.describe Admin::DocumentSearchTypesController, type: :controller do

  before :each do
    @user = create(:user, is_admin: true)
    sign_in @user
  end

  describe 'GET #new' do
    it 'assigns a new document_search_type as @document_search_type' do
      get :new, params: {}
      expect(assigns(:document_search_type)).to be_a_new(DocumentSearchType)
    end

    it 'redirects non-admin Users to the root_url' do
      sign_out @user
      sign_in create(:user, is_admin: false)

      get :new, params: {}

      expect(response).to redirect_to(root_url)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested document_search_type as @document_search_type' do
      document_search_type = create(:document_search_type)
      get :edit, params: {id: document_search_type.to_param}
      expect(assigns(:document_search_type)).to eq(document_search_type)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      before(:each) do
        @valid_attributes = { name: 'DocumentSearchTypeName'}
      end

      it 'creates a new document_search_type' do
        expect {
          post :create, params: {document_search_type: @valid_attributes}
        }.to change(DocumentSearchType, :count).by(1)
      end

      it 'assigns a newly created document_search_type as @document_search_type' do
        post :create, params: {document_search_type: @valid_attributes}
        expect(assigns(:document_search_type)).to be_a(DocumentSearchType)
        expect(assigns(:document_search_type)).to be_persisted
      end
    end

    context 'with invalid params' do
      before(:each) do
        allow_any_instance_of(DocumentSearchType).to receive(:save).and_return(false)
      end

      it 'assigns a newly created but unsaved document_search_type as @document_search_type' do
        post :create, params: {document_search_type: build(:document_search_type).attributes}
        expect(assigns(:document_search_type)).to be_a_new(DocumentSearchType)
      end

      it 're-renders the "new" template' do
        post :create, params: {document_search_type: build(:document_search_type).attributes}
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      before(:each) do
        @valid_attributes = build(:document_search_type).attributes
      end

      it 'updates the requested document_search_type' do
        document_search_type = create(:document_search_type, name: 'OldDocumentSearchTypeName')
        put :update, params: {id: document_search_type.to_param, document_search_type: {name: 'NewDocumentSearchTypeName'} }
        document_search_type.reload

        expect(document_search_type.name).to eq('NewDocumentSearchTypeName')
      end

      it 'assigns the requested document_search_type as @document_search_type' do
        document_search_type = create(:document_search_type)
        put :update, params: {id: document_search_type.to_param, document_search_type: @valid_attributes}
        expect(assigns(:document_search_type)).to eq(document_search_type)
      end
    end

    context 'with invalid params' do
      before(:each) do
        allow_any_instance_of(DocumentSearchType).to receive(:save).and_return(false)
      end

      it 'assigns the document_search_type as @document_search_type' do
        document_search_type = create(:document_search_type)
        put :update, params: {id: document_search_type.to_param, document_search_type: build(:document_search_type).attributes}
        expect(assigns(:document_search_type)).to eq(document_search_type)
      end

      it 're-renders the "edit" template' do
        document_search_type = create(:document_search_type)
        put :update, params: {id: document_search_type.to_param, document_search_type: build(:document_search_type).attributes}
        expect(response).to render_template('edit')
      end
    end
  end
end
