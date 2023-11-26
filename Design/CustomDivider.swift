//
//  CustomDivider.swift
//  MyFavoriteBands
//
//  Created by Brent Beamer on 11/22/23.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDivider()
}
