#!/usr/bin/env ruby
require "rails_helper"

RSpec.describe MatchesController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the 'index' template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all matches into @matches" do
      str_1, str_2 = Match.create!, Match.create!
      get :index

      expect(assigns(:matches)).to match_array([str_1, str_2])
    end

  end

  describe "GET matches/new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the 'new' template" do
      get :new
      expect(response).to render_template("matches/new")
    end
  end

=begin
  No show spec
=end

  describe "detect_anagram" do
    it "verify if the function works" do
      str_1 = "ãẽĩõũÂÊÎÔÛÃẼĨÕŨáéíóúÀÈÌÒÙÇ?!"
      str_2 = "aioeuoieuaeiouaeuiaoeuiaoc"
      @controller = MatchesController.new
      @controller.instance_eval{ detect_anagram(str_1, str_2)}
      10.times { expect(@controller.instance_eval{ detect_anagram(str_1, str_2)}).to eq(true) }
    end
  end
end