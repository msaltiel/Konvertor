//
//  KonverVzdialenostView.swift
//  Konvertor
//
//  Created by Marcel Saltiel on 23/10/2022.
//

import SwiftUI

struct KonverVzdialenostView: View {
    @State private var vstupnaVzdialenost: Double = 1
    @State private var vstupnaJednotka = "cm"
    let vsetkyJednotky = ["km", "m", "cm", "mm", "mi", "yd", "ft", "in"]
    
    var vstupnaVzdialenostMM: Double {
        var konvertovanienaMM: Double
        switch vstupnaJednotka {
        case "km":
            konvertovanienaMM = vstupnaVzdialenost * 1_000_000
        case "m":   konvertovanienaMM = vstupnaVzdialenost * 1_000
        case "cm":   konvertovanienaMM = vstupnaVzdialenost * 10
        case "mi": konvertovanienaMM = vstupnaVzdialenost * 1_609_344
        case "yd": konvertovanienaMM = vstupnaVzdialenost * 914.4
        case "ft": konvertovanienaMM = vstupnaVzdialenost * 304.8
        case "in": konvertovanienaMM = vstupnaVzdialenost * 25.4
        default: konvertovanienaMM = vstupnaVzdialenost
        }
        return konvertovanienaMM
    }
    var body: some View {
        Form {
            Section("Zadaj vstupne jednotky") {
                TextField("zadaj vzdialenost", value: $vstupnaVzdialenost, format: .number) .keyboardType(.decimalPad)
                
                
                Picker("Vyber vstupnu jednotku", selection: $vstupnaJednotka) {
                    ForEach(vsetkyJednotky, id:\.self) { jednotka in
                        Text(jednotka)
                    }
                }
                .pickerStyle(.menu)
            }
            
            Section("Metricke"){
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output: "km"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output: "m"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output: "cm"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output: "mm"))
            }
            Section("Imperialne"){
                Text (vypocitajVzdialenost(vstupnaVzdialenostMM, output: "mi"))
                Text (vypocitajVzdialenost(vstupnaVzdialenostMM, output: "yd"))
                Text (vypocitajVzdialenost(vstupnaVzdialenostMM, output: "ft"))
                Text (vypocitajVzdialenost(vstupnaVzdialenostMM, output: "in"))
            }
        }
        .navigationTitle("Vzdialenost")
    }
    
    func vypocitajVzdialenost (_ vzdialenost: Double, output: String)->String{
        var vystup: Double
        switch output{
        case "km": vystup=vzdialenost / 1_000_000
        case "m": vystup=vzdialenost / 1_000
        case "cm": vystup=vzdialenost / 10
        case "mi": vystup=vzdialenost / 1_609_344
        case "yd": vystup=vzdialenost / 914.4
        case "ft": vystup=vzdialenost / 304.8
        case "in": vystup=vzdialenost / 25.4
        default: vystup=vzdialenost
        }
        
        var textovyVystup = String(format: "%.6f", vystup)
        
        while textovyVystup.last == "0"{
            textovyVystup.removeLast()
        }
        if textovyVystup.last == "."{
            textovyVystup.removeLast()
        }
        
        return "\(textovyVystup) \(output)"
    }
}

struct KonverVzdialenostView_Previews: PreviewProvider {
    static var previews: some View {
        KonverVzdialenostView()
    }
}


