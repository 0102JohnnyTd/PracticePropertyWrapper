//
//  SwitchColorView.swift
//  PracticePropertyWrapper
//
//  Created by Johnny Toda on 2023/05/02.
//

import SwiftUI

struct SwitchColorView: View {
    var body: some View {
        VStack {
            StateObjectCountView()
        }
    }
}

// @StateObjectを付与したデータオブジェクトを持つ構造体を定義
struct StateObjectCountView: View {
    @StateObject private var dataSource = DataSource()

    var body: some View {
        VStack {
            Text("StateObject count: \(dataSource.count)")
            Button("increment") {
                dataSource.count += 1
            }
        }
    }
}

struct SwitchColorView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchColorView()
    }
}
