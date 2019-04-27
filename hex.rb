def from_hex(str)
    hex = {"A"=>10, "B"=>11, "C"=>12, "D"=>13, "E"=>14, "F"=>15}
    num = str.upcase.chars.reverse
    result = 0
    for i in 0..num.length-1 do
        if hex.include?(num[i])
            num[i] = hex[num[i]]
            puts num.inspect
        end
        result += num[i].to_i*(16**i)
        puts result
    end
    return result
end

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

def from_base_x_to_base_y(base_x,base_y,num)
    dec = to_decimal(base_x,num)
    return to_base_x(base_y, dec)
end

puts "********** Hex converter **********"
puts "Convertion base-x vers base-y"
print "Veillez choisir votre base de numération de départ : "
base_x = gets.to_i
print "Veillez choisir votre base de numération d'arrivée : "
base_y = gets.to_i
print "Veillez saisir le nombre à convertir : "
num = gets.to_i
print "Résultat : #{from_base_x_to_base_y(base_x, base_y, num)}"