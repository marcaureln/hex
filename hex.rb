puts "********** Hex converter **********"
puts "Convertion base-x vers base-10"
print "Veillez choisir votre base de numération : "
base = gets.to_i
print "Veillez saisir le nombre à convertir : "
num = gets.to_i
tab = num.digits
res = 0
for i in 0..tab.length-1 do
    tab[i] = tab[i]*(base**i)
    res += tab[i]
end
print "Résultat : #{res}"