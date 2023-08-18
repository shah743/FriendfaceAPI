require 'csv'

file_path = Rails.root.join('public', 'friendface.csv')
CSV.foreach(file_path, headers: true) do |row|
  Like.create(post_id: row['post-id'], user: row['user'], date: Date.parse(row['date']))
end
