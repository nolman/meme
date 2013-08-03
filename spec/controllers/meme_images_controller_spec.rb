require 'spec_helper'

describe MemeImagesController do
  render_views

  let(:valid_session) {  }
  let!(:meme_image) { FactoryGirl.create(:meme_image) }
  let(:test_image) do
    Rack::Test::UploadedFile.new(Rails.root.join("spec", "fixtures", "success.jpg"), "image/jpeg")
  end
    
  describe "GET index" do
    it "responds successfully" do
      get :index, {}, valid_session
      response.should be_success
    end
  end

  describe "POST create" do
    it "creates a meme" do
      expect {
        post :create, {meme_image: {name: "hello world", meme: test_image}}, valid_session
        response.should redirect_to(meme_image_path(MemeImage.last))
      }.to change(MemeImage, :count).by(1)
    end
  end

  describe "PUT update" do
    it "updates a meme" do
      expect {
        put :update, {id: meme_image.id, meme_image: {name: "new name"}}, valid_session
        response.should redirect_to(meme_image_path(meme_image))
      }.to change {meme_image.reload.name}.from(meme_image.name).to("new name")
    end
  end

  describe "DELETE destroy" do
    it "deletes a meme image" do
      expect {
        delete :destroy, {id: meme_image.to_param}, valid_session
        response.should redirect_to(meme_images_path)
      }.to change(MemeImage, :count).by(-1)
    end
  end

  describe "GET show" do
    it "responds successfully" do
      get :show, {id: meme_image.to_param}, valid_session
      response.should be_success
    end
  end

  describe "GET edit" do
    it "responds successfully" do
      get :edit, {id: meme_image.to_param}, valid_session
      response.should be_success
    end
  end

  describe "GET new" do
    it "responds successfully" do
      get :new, {}, valid_session
      response.should be_success
    end
  end
end
