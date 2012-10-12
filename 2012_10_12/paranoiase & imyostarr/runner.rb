require './lib/3n_1'

start = Time.now

result = (1..100_000).maximun_cycle_length

finish = Time.now
puts "result = #{result}, elapsed = #{finish - start}"