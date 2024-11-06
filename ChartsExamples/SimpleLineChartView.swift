//
//  SimpleLineChartView.swift
//  ChartsExamples
//
//  Created by Sophie Haber on 06.11.24.
//

import SwiftUI
import Charts

struct SimpleLineChartView: View {
    
    let chartData = [ (city: "Hong Kong", data: hkWeatherData),
                      (city: "London", data: londonWeatherData),
                      (city: "Taipei", data: taipeiWeatherData) ]
    
    var body: some View {
        
        Chart {
            ForEach(hkWeatherData) { item in
                LineMark(
                    x: .value("Month", item.date),
                    y: .value("Temp", item.temperature)
                )
            }
        }
        .frame(height: 300)
        
        .chartXAxis {
        AxisMarks(values: .stride(by: .month)) { value in
            AxisGridLine()
            AxisValueLabel(format: .dateTime.month(.defaultDigits))
        }
    }

            .chartYAxis {
        AxisMarks(position: .leading)
                    }
                    
            .chartPlotStyle { plotArea in
        plotArea
            .background(.blue.opacity(0.1))
                }
            
                    
            }
    }


#Preview {
    SimpleLineChartView()
}
