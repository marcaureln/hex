def to_decimal(base, num)
    result = 0
    for i in 0..num.digits.length-1 do
        result += num.digits[i]*(base**i)
    end
    return result
end

def to_base_x(base, num)
    result = Array.new
    begin
        result.push(num%base)
        num /= base
    end while num/base!=0
    result.push(num%base) # the loop end when the divsion answer is 0 so it doesn't calculate the last modulo
    return result.reverse.join
end

puts "********** Hex converter **********"
puts "Convertion base-10 vers base-x"
print "Veillez choisir votre base de numération : "
base = gets.to_i
print "Veillez saisir le nombre à convertir : "
num = gets.to_i
print "Résultat : #{to_base_x(base, num)}"