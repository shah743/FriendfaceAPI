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

  describe "GET #streaks" do
    context "when there's a single streak" do
      before do
        Like.create!(post_id: "1", user: "John", date: Date.new(2023, 8, 14)) # Monday
        Like.create!(post_id: "2", user: "John", date: Date.new(2023, 8, 15)) # Tuesday
        Like.create!(post_id: "3", user: "Jane", date: Date.new(2023, 8, 15)) # Tuesday
        Like.create!(post_id: "4", user: "Jane", date: Date.new(2023, 8, 16)) # Wednesday
        Like.create!(post_id: "5", user: "John", date: Date.new(2023, 8, 16)) # Wednesday
        Like.create!(post_id: "6", user: "John", date: Date.new(2023, 8, 16)) # Wednesday
      end

      it "returns the correct streak data" do
        get :streaks
        expect(response).to be_successful
        json = JSON.parse(response.body)
        expect(json["streaks"].first["start"]).to eq('2023-08-14')
        expect(json["streaks"].first["end"]).to eq('2023-08-16')
      end
    end
  end
end
