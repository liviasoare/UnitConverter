//
//  ContentView.swift
//  UnitConverter
//
//  Created by Livia Soare on 22.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = 0.0
    @State private var inputUnit = "centimeters"
    @State private var outputUnit = "meters"
    
    @FocusState private var numberIsFocused: Bool
    
    let units = ["picometers","nanometers","micrometers","millimeters", "centimeters", "decimeters", "meters", "dekameters", "hectometers", "kilometers"]
    
    var converted : Double = 0.0
    
    //do calculations
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Enter your value", value: $inputNumber, format: .number)
                } header: {
                    Text("Enter your value")
                }
                .keyboardType(.decimalPad)
                .focused($numberIsFocused)
                
                Picker("Input Unit", selection: $inputUnit){
                    ForEach(units, id: \.self){
                        Text($0)
                    }
                }
                
                Picker("Output Unit", selection: $outputUnit){
                    ForEach(units, id: \.self){
                        Text($0)
                    }
                }
                
                Section{
                    Text(inputNumber, format: .number)
                    
                } header: {
                    Text("Result")
                }
                
            }
            .navigationTitle("Length Unit Converter")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    
                    Button("Done"){
                        numberIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
