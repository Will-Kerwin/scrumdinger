//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by Will Kerwin on 27/06/2024.
//

import SwiftUI

struct SpeakerArc: Shape {
    
    let speakerIndex: Int
    let totalSpeakers: Int
    
    private var degreesPerSepaker: Double {
        360.0/Double(totalSpeakers)
    }
    
    private var startAngle: Angle {
        Angle(degrees: degreesPerSepaker * Double(speakerIndex) + 1.0)
    }
    
    private var endAngle: Angle {
        Angle(degrees: degreesPerSepaker + startAngle.degrees - 1.0)
    }
    
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        return Path {
            path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
    
}
