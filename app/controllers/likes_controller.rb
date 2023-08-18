class LikesController < ApplicationController
  def most_likes
    # Group by day and get the count
    day_likes = Like.group_by_day(:date).count

    # Return an error if there are no likes
    if day_likes.empty?
      render json: { error: "No likes found" } and return
    end

    # Find the maximum number of likes
    max_likes = day_likes.values.max

    # Get all days with the maximum number of likes
    most_liked_days = day_likes.select { |_, v| v == max_likes }.keys.map { |date| date.strftime('%A') }

    render json: { days: most_liked_days, likes: max_likes }
  end

  def streaks
    likes_by_date = Like.group(:date).order(:date).count
    streaks = []
    streak = []

    likes_by_date.each_cons(2) do |(prev_date, prev_count), (current_date, current_count)|
      if current_count > prev_count
        streak << prev_date if streak.empty?
        streak << current_date
      else
        streaks << streak if streak.length > 1
        streak = []
      end
    end

    streaks << streak if streak.length > 1
    render json: { streaks: streaks.map { |s| { start: s.first, end: s.last } } }
  end

end
