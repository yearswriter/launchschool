require 'yaml'

CONFIG      = YAML.load_file('loan_calc_config.yml')
TARIFS      = CONFIG['tarifs']
ID_METHODS  = CONFIG['id_methods']
PROMTS      = CONFIG['promts']
NAME = "TEST"
puts sprintf("#{PROMTS['top_line']}|#{PROMTS['bye']}%-#{31-NAME.length}s|\n#{PROMTS['bot_line']}", NAME.downcase.capitalize + "!")
