//
//  FlightBoardView.swift
//  FlightTimeline
//
//  Created by MikhaiL on 23.06.2023.
//

import SwiftUI

struct FlightBoardView: View {
    @State private var hiddenCanceled = false
    let boardName: String
    let flightInfo: [FlightInformation]
    
    private var shownFlight: [FlightInformation] {
        hiddenCanceled
        ? flightInfo.filter { $0.status != .cancelled }
        : flightInfo
    }
    
    var body: some View {
        List(shownFlight) { flight in
            NavigationLink(destination: FlightDetailsView(flight: flight)) {
                FlightRowView(flight: flight)
            }
        }
        .listStyle(.plain)
        .navigationTitle(boardName)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Toggle("Hide canceled", isOn: $hiddenCanceled)
            }
        }
    }
}

struct FlightBoardView_Previews: PreviewProvider {
    static var previews: some View {
        FlightBoardView(boardName: "Flight Board", flightInfo: FlightInformation.generateFlights())
    }
}
