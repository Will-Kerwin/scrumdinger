//
//  EditViewSheet.swift
//  Scrumdinger
//
//  Created by Will Kerwin on 26/06/2024.
//

import SwiftUI

struct EditScrumSheet: View {
    @Binding var scrum: DailyScrum
    @Binding var isPresentingEditScrumView: Bool
    @State private var editingScrum = DailyScrum.emptyScrum

    var body: some View {
        NavigationStack{
            DetailEditView(scrum: $editingScrum)
                .navigationTitle(scrum.title)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel"){
                            isPresentingEditScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction){
                        Button("Done"){
                            isPresentingEditScrumView = false
                            scrum = editingScrum
                        }
                    }
                    
                }
        }
        .onAppear(){
            editingScrum = scrum
        }
        .onDisappear(){
            editingScrum = DailyScrum.emptyScrum
        }
    }
}

#Preview {
    EditScrumSheet(scrum: .constant(DailyScrum.sampleData[0]), isPresentingEditScrumView: .constant(true))
}
