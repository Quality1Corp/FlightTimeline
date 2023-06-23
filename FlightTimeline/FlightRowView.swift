//
//  FlightRowView.swift
//  FlightTimeline
//
//  Created by MikhaiL on 23.06.2023.
//

import SwiftUI

struct FlightRowView: View {
    let flight: FlightInformation
    
    var body: some View {
        HStack {
            Text("\(flight.airline) \(flight.number)")
                .frame(width: 120, alignment: .leading)
            Text(flight.otherAirport)
                .frame(alignment: .leading)
            Spacer()
            
            Text(flight.flightStatus)
        }
    }
}

struct FlightRowView_Previews: PreviewProvider {
    static var previews: some View {
        FlightRowView(flight: FlightInformation.generateFlight())
    }
}
