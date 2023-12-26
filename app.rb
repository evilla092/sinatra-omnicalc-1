require "sinatra"
require "sinatra/reloader"

get("/") do

erb(:square_with_form)
end

get("/square/new") do
  erb(:square_with_form)
end

get("/square/results") do
  @num_squared = params.fetch("user_num")
  @squared_result = @num_squared.to_f ** 2

  erb(:square_with_results)
end

get("/square_root/new") do
  erb(:square_root_with_form)
end

get("/square_root/results") do
  @num_square_rooted = params.fetch("num")
  @square_root_of_num = @num_square_rooted.to_f ** 0.5
  erb(:square_root_with_results)
end

get("/payment/new") do
  erb(:payment_with_form)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f
  @years = params.fetch("years").to_i
  @principal = params.fetch("principal").to_f
  rate = @apr /100 / 12
  number_of_periods = @years * 12
  numerator = rate*@principal
  denominator = 1 - (1 + rate) ** -number_of_periods
  @monthly_payment = (numerator / denominator).to_f.to_fs(:currency)
  @principal = params.fetch("principal").to_f.to_fs(:currency)
  @apr = params.fetch("apr").to_f.to_fs(:percentage, {:precision => 4})
  erb(:payment_with_results)
end

get("/random/new") do
  erb(:random_with_form)
end

get("/random/results") do
  @min = params.fetch(:min).to_f
  @max = params.fetch(:max).to_f
  @random_number = rand(@min..@max)
  erb(:random_with_results)
end
