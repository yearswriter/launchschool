a = ['white snow', 'winter wonderland', 'melting ice',
    'slippery sidewalk', 'salted roads', 'white trees']

print a.map{|v| v.split(' ')}.flatten!
