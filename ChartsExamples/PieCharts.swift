//
//  PieCharts.swift
//  ChartsExamples
//
//  Created by Sophie Haber on 06.11.24.
//

import SwiftUI
import Charts

struct PieCharts: View {
    
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

                    SectorMark(
                        angle: .value("Cup", coffee.count),
                        angularInset: 2.0
                    )
                    .foregroundStyle(by: .value("Type", coffee.name))
                    .annotation(position: .overlay) {
                Text("\(coffee.count)")
                    .font(.headline)
                    .foregroundStyle(.white)
                                }
                    
                }
            }
            .frame(height: 500)
        }
        .padding()

    }
}

struct DonutCharts: View {
    
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

                    SectorMark(
                        angle: .value("Cup", coffee.count),
                        innerRadius: .ratio(0.65),
                        angularInset: 2.0
                    )
                    .foregroundStyle(by: .value("Type", coffee.name))
                    .annotation(position: .overlay) {
                Text("\(coffee.count)")
                    .font(.headline)
                    .foregroundStyle(.white)
                                }
                    
                }
            }
            .frame(height: 500)
            .chartBackground { proxy in
                Text ("􀸙")
                    .font(.system(size: 100))
            }
        }
        .padding()

    }
}

#Preview {
    PieCharts()
}

#Preview {
    DonutCharts()
}
