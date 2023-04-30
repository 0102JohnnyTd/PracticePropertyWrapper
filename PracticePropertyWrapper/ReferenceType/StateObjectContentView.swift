//
//  StateObjectContentView.swift
//  PracticePropertyWrapper
//
//  Created by Johnny Toda on 2023/04/30.
//

import SwiftUI

// データオブジェクトを監視させるにはObservableObjectプロトコルに準拠させる必要がある
final class DataSource: ObservableObject {
    // 監視したい値には@Publishedをつける
    @Published var count = 0
}

struct StateObjectContentView: View {
    // @StateObjectの望ましい使用条件
       // ①参照型のデータ
       // ②データの発生源はView自身
    @StateObject private var dataSource = DataSource()
    
    var body: some View {
        VStack {
            Text(String(dataSource.count))
            Button("Increment") {
                dataSource.count += 1
            }
        }

    }
}

struct StateObjectContentView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectContentView()
    }
}
