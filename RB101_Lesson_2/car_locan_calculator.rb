=begin
  General plan:
  Make config with 3 different (named) tarif plans for loans
   - with paramters:
    #Annual Percentage Rate (APR is expressed as a percentage that represents the actual yearly cost of funds over the term of a loan)
    #aviable loan duration
    #aviable loan amount
  Make config with 3 different methods of identification:
    - by Name, Family name, and phone
    - by Name, Family name, and email
    - by Name, Family name, and post number
    Store regex string in config for phone|email|id use Regexp.new
    Validate input:
     - Name, Family: not empty, only A-z
     - phone: /^\+\d+\(\d{3}\)\d{3}-\d{2}-\d{2}$/
     - email: /(\d*[A-z]*\d*\.)*(\d*[A-z]*\d*)+@()\d*[A-z]\d*)+\.[a-z][a-z]+/
     - id: /^\d{8}/
   Greet User, Ask for Name, Family name, id in a loop with validations
      calculate monthly interest rate:
        m = p * (j/(1-(1+j)**(-n)))
        output:
        On your tarif with APR=a,loan amount = p, and loan duration = n,
         your monthly payment will be m, with monthly interes rate of j%
         your total will be: m * 12
=end
