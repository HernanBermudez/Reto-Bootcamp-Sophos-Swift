//
//  AsyncButton.swift
//  Sophos App
//
//  Created by 1801C724748LM on 22/12/2022.
//

import Foundation
import SwiftUI

struct AsyncButton<Content: View>: View {
    
    @StateObject var loginVM = ViewModel()
    
    var isComplete: Bool
    let action: ()->()
    let content: Content
    
    init(isComplete: Bool, action: @escaping ()->(), @ViewBuilder label: ()->Content) {
        self.action = action
        self.isComplete = isComplete
        self.content = label()
    }
    
    var body: some View {
        Button(action: {
            if !loginVM.inProgress { action() }
            withAnimation(Animation.easeInOut(duration: 0.4)) {}
        }, label: {
            VStack(alignment: .trailing) {
                if loginVM.inProgress && !isComplete {
                    ProgressView()
                        .foregroundColor(.white)
                } else if isComplete {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 15, height: 15, alignment: .center)
                        .foregroundColor(.white)
                } else {
                    content
                }
            }
            .frame(maxWidth: isComplete || loginVM.inProgress ? 50 : .infinity, maxHeight: isComplete  || loginVM.inProgress ? 50 : nil, alignment: .center)
            .padding(.vertical, isComplete  || loginVM.inProgress ? 0 : 15)
            .foregroundColor(.white)
            .background(colorSophos)
            .cornerRadius(25)
            .font(Font.body.weight(.semibold))
            .padding(.all, 20)
        })
    }
}
