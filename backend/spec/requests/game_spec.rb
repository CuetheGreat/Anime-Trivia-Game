require 'rails_helper'

RSpec.describe "Games", type: :request do
  describe "GET /new_game" do
    it "returns http success" do
      get "/game/new_game"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /draw" do
    it "returns http success" do
      get "/game/draw"
      expect(response).to have_http_status(:success)
    end
  end

end
