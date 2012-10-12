nonkaprekar = (1..5000).to_a
(1..5000).each { |n| nonkaprekar.delete(n + n.to_s.split(//).map {|e| e.to_i}.inject { |sum, e| sum + e }) }
p nonkaprekar.inject { |sum,n| sum + n }
