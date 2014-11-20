json.array!(@calculators) do |calculator|
  json.extract! calculator, :id, :email, :telephone, :post_code, :current_rent, :initial_cost
  json.url calculator_url(calculator, format: :json)
end
