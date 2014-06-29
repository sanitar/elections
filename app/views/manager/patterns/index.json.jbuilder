json.array!(@patterns) do |pattern|
  json.extract! pattern, :id, :text, :first_name, :last_name, :middle_name, :district, :email, :mobile, :skype, :age, :sex, :conversation_status
  json.url pattern_url(pattern, format: :json)
end
