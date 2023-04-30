//
//  ObservedObjectContentView.swift
//  PracticePropertyWrapper
//
//  Created by Johnny Toda on 2023/04/30.
//

import SwiftUI


struct ObservedObjectParentView: View {
    @StateObject private var dataSource = DataSource()
    var body: some View {
        ObservedObjectContentView(dataSource: dataSource)
    }
}

struct ObservedObjectContentView: View {
    // @ObservedObjectの望ましい使用条件
       // ①参照型のデータ
       // ②データの発生源は外部
    @ObservedObject var dataSource: DataSource

    var body: some View {
        VStack {
            Text(String(dataSource.count))
            Button("increment") {
                dataSource.count += 1
            }
        }
    }
}

struct ObservedObjectContentView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectParentView()
    }
}
