//
//  DStackLayout.swift
//  SMSU_6
//
//  Created by Andrei Kovryzhenko on 16.10.2023.
//

import SwiftUI

struct DStackLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let height = proposal.height ?? 0
        let width = proposal.width ?? 0
         return CGSize(width: width, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let side = bounds.size.height / CGFloat(subviews.count)
        var tempX = bounds.origin.x
        var tempY = bounds.maxY - side
        
        for subview in subviews {
            subview.place(
                at: CGPoint(x: tempX, y: tempY),
                proposal: ProposedViewSize(CGSize(width: side, height: side))
            )
            tempX += (bounds.size.width - side) / CGFloat(subviews.count - 1)
            tempY -= bounds.size.height / CGFloat(subviews.count)
        }
    }
}
