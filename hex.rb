def to_decimal(base, num)
    result = 0
    for i in 0..num.digits.length-1 do
        result += num.digits[i]*(base**i)
    end
    return result
end

puts "********** Hex converter **********"
puts "Convertion base-x vers base-10"
print "Veillez choisir votre base de numération : "
base = gets.to_i
print "Veillez saisir le nombre à convertir : "
num = gets.to_i
print "Résultat : #{to_decimal(base, num)}"