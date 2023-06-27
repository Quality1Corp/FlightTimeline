//
//  HomeScreenView.swift
//  FlightTimeline
//
//  Created by MikhaiL on 23.06.2023.
//

import SwiftUI

enum Route: Hashable {
    case arrivals
    case departures
    case timeline
    
    var title: String {
        switch self {
            case .arrivals:
                return "Arrivals"
            case .departures:
                return "Departures"
            case .timeline:
                return "Flight Timeline"
        }
    }
}

struct HomeScreenView: View {
    private let flightInfo = FlightInformation.generateFlights()
    
    private var arrivals: [FlightInformation] {
        flightInfo.filter {
            $0.direction == .arrival
        }
    }
    
    private var departures: [FlightInformation] {
        flightInfo.filter {
            $0.direction == .departure
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(systemName: "airplane")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .opacity(0.1)
                    .rotationEffect(.degrees(-90))
                
                VStack(alignment: .leading) {
                    NavigationLink(Route.arrivals.title, value: Route.arrivals)
                    NavigationLink(Route.departures.title, value: Route.departures)
                    NavigationLink(Route.timeline.title, value: Route.timeline)
                    
                    Spacer()
                }
                .font(.title)
                .padding()
            }
            .navigationTitle("Airport")
            .navigationDestination(for: Route.self) { route in
                switch route {
                    case .arrivals:
                        FlightBoardView(boardName: Route.arrivals.title, flightInfo: arrivals)
                    case .departures:
                        FlightBoardView(boardName: Route.departures.title, flightInfo: departures)
                    case .timeline:
                        TimeLineView(flights: flightInfo)
                }
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
