def calculate_rate(oil)
  oil = oil.to_f
  if oil <= 0
    :error
  elsif oil <= 20
    oil * 0.9
  elsif oil <= 60
    oil * 0.8 + 2
  else
    oil * 0.75 + 5
  end
end
