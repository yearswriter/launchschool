arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
print arr.delete_if { |v| v.downcase.start_with?('s')}
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
print arr.delete_if { |v| v.downcase.start_with?('w') || v.downcase.start_with?('s')}
print arr.delete_if { |v| v.downcase.start_with?('w','s')}
