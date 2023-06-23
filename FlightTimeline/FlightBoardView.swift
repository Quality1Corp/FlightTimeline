//
//  FlightBoardView.swift
//  FlightTimeline
//
//  Created by MikhaiL on 23.06.2023.
//

import SwiftUI

struct FlightBoardView: View {
    let boardName: String
    let flightInfo: [FlightInformation]
    
    var body: some View {
        List(flightInfo) { flight in
            FlightRowView(flight: flight)
        }
        .listStyle(.plain)
        .navigationTitle(boardName)
    }
}

struct FlightBoardView_Previews: PreviewProvider {
    static var previews: some View {
        FlightBoardView(boardName: "Flight Board", flightInfo: FlightInformation.generateFlights())
    }
}
