//
//  UserProfileView.swift
//  FlightTimeline
//
//  Created by MikhaiL on 23.06.2023.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        Image(systemName: "person.circle")
            .resizable()
            .frame(width: 120, height: 120)
            .foregroundColor(.gray)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
