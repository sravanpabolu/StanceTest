//
//  ErrorView.swift
//  Stance
//
//  Created by Sravan Kumar Pabolu on 21/08/24.
//

import SwiftUI

struct ErrorView: View {
    let description: String
    
    var body: some View {
        Text(description)
            .padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(description: "Unknown Error")
    }
}
