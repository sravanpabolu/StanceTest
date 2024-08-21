//
//  HomeView.swift
//  Stance
//
//  Created by Sravan Kumar Pabolu on 21/08/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            screenView
            .onAppear {
                viewModel.getSessionData()
            }
        }
    }
    
    @ViewBuilder
    private var screenView: some View {
        if viewModel.isLoading {
            ProgressView()
        } else if let error = viewModel.error {
            ErrorView(description: error.description)
        } else {
            if let session = viewModel.sessionData {
                SessionsListView(session: session)
            } else {
                Text("No session data available")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
