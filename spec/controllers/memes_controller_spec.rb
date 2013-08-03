require 'spec_helper'

describe MemesController do
  render_views

  let(:valid_attributes) { { name: "helloworld"} }
  let(:valid_session) {  }
  let(:meme_image) { FactoryGirl.create(:meme_image) }

  describe "GET index" do
    it "assigns all applications as @applications" do
      get :index, {}, valid_session
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested application as @application" do
      get :show, {:id => meme_image.to_param}, valid_session
      response.should be_success
    end
  end

  describe "GET new" do
    it "assigns the requested application as @application" do
      get :new, {}, valid_session
      response.should be_success
    end
  end

  describe "GET edit" do
    it "assigns the requested application as @application" do
      get :edit, {:id => meme_image.to_param}, valid_session
      response.should be_success
    end
  end
end
