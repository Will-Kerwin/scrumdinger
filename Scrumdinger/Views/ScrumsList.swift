//
//  ScrumsList.swift
//  Scrumdinger
//
//  Created by Will Kerwin on 27/06/2024.
//

import SwiftUI

struct ScrumsList: View {
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    var body: some View {
        List($scrums){ $scrum in
            NavigationLink(destination: DetailView(scrum: $scrum)) {
                CardView(scrum: scrum)
                
            }
            .listRowBackground(scrum.theme.mainColor)
        }
        .navigationTitle("Daily Scrums")
        .toolbar{
            Button(action:{
                isPresentingNewScrumView = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
    }
}

#Preview {
    ScrumsList(scrums: .constant(DailyScrum.sampleData), isPresentingNewScrumView: .constant(false))
}
