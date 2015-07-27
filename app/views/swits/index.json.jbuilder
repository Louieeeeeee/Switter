json.array!(@swits) do |swit|
  json.extract! swit, :id, :user_id, :message, :sweet, :sour
  json.url swit_url(swit, format: :json)
end
