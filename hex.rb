def from_hex(str)
    hex = {"A"=>10, "B"=>11, "C"=>12, "D"=>13, "E"=>14, "F"=>15}
    num = str.upcase.chars.reverse
    result = 0
    for i in 0..num.length-1 do
        num[i] = hex[num[i]] if hex.include?(num[i]) # replace alphabetic characters by numerics ones
        result += num[i].to_i*(16**i)
    end
    return result
end

def to_hex(num)
    hex = {"10"=>"A", "11"=>"B", "12"=>"C", "13"=>"D", "14"=>"E", "15"=>"F"}
    result = Array.new
    while num/16 > 0
        result.push(num%16)
        num /= 16
    end
    result.push(num%16) # the loop end when the divsion answer is 0 so it doesn't calculate the last modulo
    result.map! { |x| x.to_s } # convert all numbers to string to replace numbers greater than 9 by their hex letters
    for i in 0..result.length-1 do
        result[i] = hex[result[i]] if hex.include?(result[i]) # replace numerics characters by alphabetic ones
    end

    return result.reverse.join
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

def convert(from,to,num) 
    # convert func use a bridge methode; first we convert to decimal and then to the desired base
    # if the given num is an hexadecimal one use the dedicaded func from_hex to convert it to decimal, if not use the default to_decimal func 
    (from==16)? dec = from_hex(num) : dec = to_decimal(from,num.to_i) 

    # case statement to select the right function according to the chosen base
    case to 
    when 10
        return dec
    when 2..8
        return to_base_x(to, dec)
    when 16
        return to_hex(dec)
    else
        return 42
    end
end

# THE PROGRAM START HERE
puts "********** Hex Dec Oct Bin Converter **********"
puts "Convertion base-x vers base-y"
print "Veillez choisir votre base de numération de départ : "
from = gets.to_i
print "Veillez choisir votre base de numération d'arrivée : "
to = gets.to_i
print "Veillez saisir le nombre à convertir : "
num = gets.chomp # it gets the input as string to keep hexadecimal characters
print "Résultat : #{convert(from, to, num)}"