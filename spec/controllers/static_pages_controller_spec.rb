require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
render_views

  let(:base_title) { 'Ruby on Rails Tutorial Sample App' }
  describe 'Static Page' do
    describe 'Home Page' do
      it 'home response successflly' do
        get :home
        expect(response).to have_http_status(:success)
        assert_select "title", "#{base_title}"
      end
    end

    describe 'Help Page' do
      it 'help response successflly' do
        get :help
        expect(response).to have_http_status(:success)
        assert_select "title", "Help | #{base_title}"
      end
    end

    describe 'About Page' do
      it 'about response successflly' do
        get :about
        expect(response).to have_http_status(:success)
        assert_select "title", "About | #{base_title}"
      end
    end

  end
end
