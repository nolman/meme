require 'spec_helper'

describe MemesController do
  let(:valid_session) { {} }
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

  describe "GET show" do
    it "responds successfully" do
      get :show, {id: FactoryGirl.create(:meme_caption)}, valid_session
      response.should be_success
    end
  end

  describe "GET images" do
    it "responds successfully" do
      get :images, {}, valid_session
      response.should be_success
    end
  end

  describe "POST upload" do
    it "creates a meme" do
      expect {
        post :upload, {meme_image: {name: "hello world", meme: test_image}}, valid_session
        response.should redirect_to(caption_meme_path(MemeImage.last))
      }.to change(MemeImage, :count).by(1)
    end
  end

  describe "POST caption_meme" do
    it "creates a caption for a meme" do
      expect {
        post :caption_meme, {id: meme_image.id, meme_caption: {upper_caption: "hello world", upper_caption: "test"}}, valid_session
        response.should redirect_to(meme_path(MemeCaption.last))
      }.to change(meme_image.meme_captions, :count).by(1)
    end
    it "handles validation erorrs" do
      expect {
        post :caption_meme, {id: meme_image.id, meme_caption: {upper_caption: "", upper_caption: ""}}, valid_session
        response.should be_success
      }.to_not change(meme_image.meme_captions, :count)
    end
  end

  describe "GET show" do
    it "responds successfully" do
      get :show, {id: FactoryGirl.create(:meme_caption).to_param}, valid_session
      response.should be_success
    end
  end

  describe "GET new" do
    it "responds successfully" do
      get :new, {}, valid_session
      response.should be_success
    end
  end

  describe "GET new_caption" do
    it "responds successfully" do
      get :new_caption, {id: FactoryGirl.create(:meme_image)}, valid_session
      response.should be_success
    end
  end
end
