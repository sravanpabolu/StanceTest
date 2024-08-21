//
//  SessionsListView.swift
//  Stance
//
//  Created by Sravan Kumar Pabolu on 21/08/24.
//

import SwiftUI

struct SessionsListView: View {
    let session: Session
    
    var body: some View {
        if let sessionSets = session.sets {
            List(sessionSets.indices, id: \.self) { index in
                NavigationLink(destination: SetDetailView(setData: sessionSets[index])) {
                    Text("Set \(index + 1)")
                }
            }
            .navigationTitle("Session Sets")
        } else {
            Text("No Data Available")
        }
    }
}
