//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Will Kerwin on 24/06/2024.
//

import SwiftUI

struct ScrumView: View {
    
    let scrums: [DailyScrum]
    
    var body: some View {
        List(scrums){ scrum in
            CardView(scrum: scrum)
                .listRowBackground(scrum.theme.mainColor)
        }
    }
}

#Preview {
    ScrumView(scrums: DailyScrum.sampleData)
}