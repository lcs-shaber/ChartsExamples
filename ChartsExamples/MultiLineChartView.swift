//
//  MultiLineChartView.swift
//  ChartsExamples
//
//  Created by Sophie Haber on 06.11.24.
//

import SwiftUI
import Charts

struct MultiLineChartView: View {
    
    let chartData = [ (city: "Hong Kong", data: hkWeatherData),
                      (city: "London", data: londonWeatherData),
                      (city: "Taipei", data: taipeiWeatherData) ]
    
    var body: some View {
        
        Chart {
            ForEach(chartData, id: \.city) { series in
                ForEach(series.data) { item in
                    LineMark(
                        x: .value("Month", item.date),
                        y: .value("Temp", item.temperature)
                    )
                }
                .foregroundStyle(by: .value("City", series.city))
                .symbol(by: .value("City", series.city))
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
    MultiLineChartView()
}
