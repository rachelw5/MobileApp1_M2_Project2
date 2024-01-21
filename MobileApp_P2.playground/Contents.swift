import UIKit


//loan calculator formula used:
// A = P * ( (r(1+r)^n) / (((1+r)^n)-1) )
// where
// A = payment Amount per period
// P = initial Principal (loan amount)
// r = interest rate per period
// n = total number of payments or periods

func payment(loanAmount : Int, numberOfPayments : Int, interestRate : Float) -> Float {

    //calculate num1 -- r(1+r)^n
    let num1 = interestRate * pow((1 + interestRate), Float(numberOfPayments))

    //calculate num2 -- ((1+r)^n)-1
    let num2 = pow((1 + interestRate), Float(numberOfPayments)) - 1

    //calculate monthly payment
    let monthlyPayment = Float(loanAmount) * (num1 / num2)

    return monthlyPayment
}

//convert interest rate for example1 to monthly rate
let monthlyInterestRate : Float = 0.044 / 12

let example1 = payment(loanAmount: 20000, numberOfPayments: 2, interestRate: monthlyInterestRate)

print(example1)

let example2 = payment(loanAmount: 150000, numberOfPayments: 30, interestRate: 0.05)

print(example2)

//format float value to dollars/cents
let formatter = NumberFormatter()
formatter.numberStyle = .currency
formatter.locale = Locale(identifier: "en_US")
formatter.minimumFractionDigits = 2
formatter.maximumFractionDigits = 2

let formattedExample1 = formatter.string(from: example1 as NSNumber)!
let formattedExample2 = formatter.string(from: example2 as NSNumber)!

print("2-month loan of $20,000, 4.4% APR, compunded monthly, monthly payment: " + formattedExample1)
print("30-year loan of $150,000, 5% APR, one annual payment each year for 30 years: " + formattedExample2)









