#!/usr/bin/env ruby
require "rails_helper"

RSpec.describe MatchesController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
=begin
    it "loads all matches into @matches" do
      match_1, match_2 = Match.create!, Match.create!
      get :index
      expect(assigns(:matches)).to match_array([match_1, match_2])
    end

  end

  describe "#detect_anagram" do
    it "detects if the strings are anagrams" do
      @post = Match.new(params.require)
    end
=end
  end
end