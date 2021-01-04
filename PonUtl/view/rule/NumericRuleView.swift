//
//  NumericRuleView.swift
//  PonUtl
//
//  Created by Mikuro Xina on 2021/01/02.
//

import SwiftUI

struct NumericRuleView: View {
    @State var value: Double = 0.0
    var valueBind: Binding<String> {
        Binding<String> { () -> String in
            return "\(value)"
        } set: { (text) in
            if let parsed = Double(text) {
                value = parsed
            }
        }

    }
    var body: some View {
        HStack {
            Text("Rotation")
            TextField("Value", text: valueBind).frame(width: 80, height: nil, alignment: .center)
            Slider(value: $value).frame(width: 160, height: nil, alignment: .center)
        }
    }
}

struct NumericRuleView_Previews: PreviewProvider {
    static var previews: some View {
        NumericRuleView()
    }
}
