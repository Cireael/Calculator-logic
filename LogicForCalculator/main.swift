//
//  main.swift
//  LogicForCalculator
//
//  Created by Julia on 23.09.2022.
//

import Foundation

enum Operations {
    case noAction
    case division
    case addition
    case substraction
    case multiplication
}

var isRunning = true
var currentNumber = "0"
var firstNumber = 0.0
var secondNumber = 0.0
var resultNumber = ""
var currentOperation = Operations.noAction


func runLoop() {
    while isRunning {
        start()
    }
}

func start() {
    print("Do you want to make calculation?")
    print("Enter yes or no")
    let answer = readLine()
    if answer == "yes" {
        updateDisplay(text: "Enter the first number: ")
        let firstNum: String = readLine()!
        currentNumber = firstNum
        updateDisplay(text: "Enter the operation type: '- + / *' ")
        let operationSign: String = readLine()!
        switch operationSign {
        case "+":
            addition()
        case "-":
            substraction()
        case "*":
            multiplication()
        case "/":
            division()
        default:
            break
        }
        updateDisplay(text: "Enter second number: ")
        let secNum = readLine()!
        currentNumber = secNum
        makeResult()
        updateDisplay(text: "Result is \(resultNumber)")
        acAction()
    } else {
        finish()
    }
}

func finish() {
    print("Running is ended")
    isRunning = false
}

func updateDisplay(text: String) {
    print(text)
}

func makeCalculation(operation: Operations) {
    if currentOperation != .noAction {
        if currentNumber != "" {
            secondNumber = Double(currentNumber) ?? 0.0
            switch operation {
            case .addition:
                resultNumber = String(firstNumber + secondNumber)
            case .substraction:
                resultNumber = String(firstNumber - secondNumber)
            case .multiplication:
                resultNumber = String(firstNumber * secondNumber)
            case .division:
                resultNumber = String(firstNumber / secondNumber)
            default:
                break
            }
        }
    } else {
        firstNumber = Double(currentNumber) ?? 0.0
        currentNumber = ""
        updateDisplay(text: currentNumber)
        currentOperation = operation
    }
}

func addition() {
    makeCalculation(operation: .addition)
}

func substraction() {
    makeCalculation(operation: .substraction)
}
func multiplication() {
    makeCalculation(operation: .multiplication)
}
func division() {
    makeCalculation(operation: .division)
}

func makeResult() {
    makeCalculation(operation: currentOperation)
}

func acAction() {
    currentNumber = ""
    firstNumber = 0.0
    secondNumber = 0.0
    resultNumber = ""
    currentOperation = Operations.noAction
    updateDisplay(text: currentNumber)
}

print("SimpleCalc program")
print("Welcome to SimpleCalc \n")
runLoop()
