//
//  ContentView.swift
//  UnitConversion
//
//  Created by Luke Inger on 24/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = ""
    @State private var selectedInput = 0
    @State private var selectedOuput = 0
    
    var Types = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var outputValue:Double{
        
        var value = Double(inputValue) ?? 0
        let inputType = Double(selectedInput)
        let outputType = Double(selectedOuput)
        
        //First convert the input to Celsius so we know what we are starting with
        if (inputType == 1) {
            value = (value - 32) / 1.8
        } else if (inputType == 2) {
            value = value - 273.15
        }
        //Now we have our celcius we can calculate the output
        //We dont need to work celcius out as this is our base value
        if (outputType==1){
            value = (value * 1.8) + 32
        } else if (outputType==2) {
            value = value + 273.15
        }
        
        return value
    }
    
    var body: some View {
        Form{
            Section(header: Text("Select your input unit")){
                Picker("Input Unit Type", selection:$selectedInput){
                    ForEach(0 ..< self.Types.count){
                        Text("\(self.Types[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Input unit")){
                TextField("Enter your input here", text:$inputValue)
                    .keyboardType(.numberPad)
            }
            Section(header: Text("Select your output unit")){
                Picker("Output Unit Type", selection:$selectedOuput){
                    ForEach(0 ..< self.Types.count){
                        Text("\(self.Types[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Out unit")){
                Text("\(outputValue, specifier: "%0.2f")")
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
