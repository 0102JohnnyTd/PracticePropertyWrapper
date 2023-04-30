//
//  BindingContentView.swift
//  PracticePropertyWrapper
//
//  Created by Johnny Toda on 2023/04/29.
//

import SwiftUI

struct ParentView: View {
    @State private var count = 0
    var body: some View {
        ChildView(count: $count)
            .frame(width: .infinity)
    }
}
struct ChildView: View {
    // @Bindingの望ましい使用条件
       // ①値型のデータ
       // ②データを更新するが、データの発生源が外部から渡される場合
    @Binding var count: Int
    var body: some View {
        Button(action: {
            count += 1
        }, label: {
            Text("\(count)")
                .font(.title)
        })
        .border(Color.red)
    }
}

struct BindingContentView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BindingContentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
