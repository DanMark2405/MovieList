//
//  TextFieldView.swift
//  MovieList
//
//  Created by Daniil Markish on 7.12.22.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    var title: String
    var placeholder: String?
    var keyboardType = UIKeyboardType.default
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
                .bold()
                .foregroundColor(.purple)
            TextField(placeholder ?? title,
                      text: $text)
            .textFieldStyle(.roundedBorder)
            .font(.title3)
            .keyboardType(keyboardType)
            
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant(""), title: "Text Field")
    }
}
