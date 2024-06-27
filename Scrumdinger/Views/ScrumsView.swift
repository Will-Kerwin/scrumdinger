//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Will Kerwin on 24/06/2024.
//

import SwiftUI

struct ScrumsView: View {
    
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction:  ()->Void
    
    var body: some View {
        if #available(iOS 16.0,*){
            NavigationStack {
               ScrumsList(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            }
            .sheet(isPresented: $isPresentingNewScrumView){
                NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            }
            .onChange(of: scenePhase) { oldValue, newValue in
                if newValue == .inactive {saveAction()}
            }
        }
        else {
            NavigationView{
                ScrumsList(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            }
            .sheet(isPresented: $isPresentingNewScrumView){
                NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            }
            .onChange(of: scenePhase) { oldValue, newValue in
                if newValue == .inactive {saveAction()}
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
