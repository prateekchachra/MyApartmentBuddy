//
//  Extensions.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 26/10/23.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform: View>(
        _ condition: Bool,
        transform: (Self) -> Transform
    ) -> some View  {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
