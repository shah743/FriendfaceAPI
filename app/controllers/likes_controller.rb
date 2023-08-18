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
    # Group likes by date and sort by date
    likes_by_date = Like.group(:date).order(:date).count

    # Initialize streaks and the current streak
    all_streaks    = []
    current_streak = []

    # Iterate through consecutive dates
    likes_by_date.each_cons(2) do |(prev_date, prev_count), (current_date, current_count)|
      if current_count > prev_count
        current_streak << prev_date if current_streak.empty?
        current_streak << current_date
      else
        # End of streak, add it to all streaks if valid
        if current_streak.length > 1
          all_streaks << { start: current_streak.first, end: current_streak.last }
        end
        current_streak = []
      end
    end

    # Handle potential streak at the end
    if current_streak.length > 1
      all_streaks << { start: current_streak.first, end: current_streak.last }
    end

    render json: { streaks: all_streaks }
  end


end
