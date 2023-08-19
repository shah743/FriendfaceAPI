require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  describe "GET #most_likes" do
    before do
      Like.create!(post_id: "2", user: "John", date: Date.today)
      Like.create!(post_id: "2", user: "John", date: Date.today)
      Like.create!(post_id: "2", user: "John", date: Date.today)
      Like.create!(post_id: "2", user: "John", date: Date.today)
      Like.create!(post_id: "3", user: "Jane", date: Date.yesterday)
    end

    it "returns the day with the most likes" do
      get :most_likes
      expect(response).to be_successful
      json = JSON.parse(response.body)
      expect(json["days"][0]).to eq(Date.today.strftime('%A'))
      expect(json["likes"]).to eq(4)
    end
  end
end
