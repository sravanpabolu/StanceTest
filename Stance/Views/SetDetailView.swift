//
//  SetDetailView.swift
//  Stance
//
//  Created by Sravan Kumar Pabolu on 21/08/24.
//

import SwiftUI
import SwiftUICharts

struct SetDetailView: View {
    let setData: SetData
    
    // Prepare data for the chart
    var speedData: [Double] {
        var speeds: [Double] = []
        
        for item in setData.reps {
            speeds.append(item.speed ?? 0.0)
        }
        return speeds
    }
    
    var body: some View {
        VStack {
            Text("Speed vs Reps")
                .font(.headline)
                .padding()
            chartView
            Spacer()
        }
        .navigationTitle("Set Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var chartView: some View {
        LineChartView(
            data: speedData,
            title: "Speed",
            legend: "Reps",
            style: ChartStyle(
                backgroundColor: Color.white,
                accentColor: Color.blue,
                secondGradientColor: Color.blue,
                textColor: Color.black,
                legendTextColor: Color.gray,
                dropShadowColor: Color.gray.opacity(0.2)
            )
        )
        .frame(height: 300)
        .padding()
    }
}
