require 'rails_helper'

RSpec.describe Public::PagesController, type: :controller do
  describe 'GET #landing' do
    it 'renders the pages#landing template' do
      get :landing

      expect(response).to render_template('landing')
    end
  end
end
