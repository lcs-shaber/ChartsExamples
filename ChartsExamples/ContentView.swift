//
//  ContentView.swift
//  ChartsExamples
//
//  Created by Sophie Haber on 04.11.24.
//

import SwiftUI
import Charts

struct ContentView: View {
    let weekdays = Calendar.current.shortWeekdaySymbols
    let steps = [ 10531, 6019, 7200, 8311, 7403, 6503, 9230 ]

    var body: some View {
        Chart {
            ForEach(weekdays.indices, id: \.self) { index in
                BarMark(x: .value("Day", weekdays[index]), y: .value("Steps", steps[index]))
                        .foregroundStyle(by: .value("Day", weekdays[index]))
                          .annotation {
                          Text("\(steps[index])")
                                        }
               }
        }
    }
}


struct BarChartsExamples: View {
    private var coffeeSales = [
        (name: "Americano", count: 120),
        (name: "Cappuccino", count: 234),
        (name: "Espresso", count: 62),
        (name: "Latte", count: 625),
        (name: "Mocha", count: 320),
        (name: "Affogato", count: 50)
    ]

    var body: some View {
        VStack {
            Chart {
                ForEach(coffeeSales, id: \.name) { coffee in
                    BarMark(
                        x: .value("Cup", coffee.count),
                        stacking: .normalized
                       
                    )
                    .foregroundStyle(by: .value("Type", coffee.name))
                }
            }
            .frame(height: 100)
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
#Preview {
    BarChartsExamples()
}
