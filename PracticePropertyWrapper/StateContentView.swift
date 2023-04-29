//
//  ContentView.swift
//  PracticePropertyWrapper
//
//  Created by Johnny Toda on 2023/04/29.
//

import SwiftUI

struct StateContentView: View {
    // @Stateの望ましい使用条件
       // ①データが値型
       // ②データの発生源がView自身
    @State private var count = 0

    var body: some View {
        Button(action: {
            count += 1
        }, label: {
            Text("現在のカウント： \(count)")
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StateContentView()
    }
}
