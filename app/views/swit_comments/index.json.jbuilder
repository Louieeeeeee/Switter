json.array!(@swit_comments) do |swit_comment|
  json.extract! swit_comment, :id, :swit_id, :user_id, :comment
  json.url swit_comment_url(swit_comment, format: :json)
end
