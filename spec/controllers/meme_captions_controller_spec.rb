require 'spec_helper'

describe MemeCaptionsController do
  render_views

  let(:valid_session) {  }
  let(:valid_attributes) { {meme_image_id: meme_image.id} }
  let!(:meme_image) { FactoryGirl.create(:meme_image) }
  let!(:meme_caption) { FactoryGirl.create(:meme_caption, meme_image: meme_image) }

  describe "GET new" do
    it "responds successfully" do
      get :new, valid_attributes, valid_session
      response.should be_success
    end
  end
  describe "GET edit" do
    it "responds successfully" do
      get :new, valid_attributes.merge(id: meme_caption.id), valid_session
      response.should be_success
    end
  end
  describe "GET show" do
    it "responds successfully" do
      get :show, valid_attributes.merge(id: meme_caption.id), valid_session
      response.should be_success
    end
  end
  describe "GET index" do
    it "responds successfully" do
      get :index, valid_attributes, valid_session
      response.should be_success
    end
  end

  describe "POST create" do
    it "creates a meme caption for an image"
  end
  describe "PUT update" do
    it "updates a meme caption for an image"
  end
  describe "DELETE destroy" do
    it "destroys a meme caption for an image"
  end
end
