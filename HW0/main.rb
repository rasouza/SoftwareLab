def sum(a)
    a.inject(0) do |sum, n| sum + n end
end

def max_2_sum(a)
    sum(a.sort.last(2))
end

def sum_to_n?(a, n)
    a.product(a).any? { |i| sum(i) == n unless i[0] == i[1] }
end

arr = [1..5, [2], [], [-1,-2,3,6,6,-8]]

arr.each do |a|
    puts "Soma de #{a.to_a}: #{sum(a)}"
    puts "Soma dos 2 maiores numeros de #{a.to_a}: #{max_2_sum(a)}"
    puts "Alguma soma da o valor 12? #{sum_to_n?(a.to_a, 12)}"
    puts
end
