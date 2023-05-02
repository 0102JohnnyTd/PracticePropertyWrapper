//
//  SwitchColorView.swift
//  PracticePropertyWrapper
//
//  Created by Johnny Toda on 2023/05/02.
//

import SwiftUI

// ボタンをタップするとサークルのカラーが切り替わるViewを定義
struct SwitchColorView: View {
    @State private var isDanger = false

    var body: some View {
        VStack {
            Spacer()
            isDanger == true ? Circle().foregroundColor(.red)
                .frame(width: 200, height: 200) :
            Circle().foregroundColor(.green)
                .frame(width: 200, height: 200)
            Button("Change color") {
                isDanger.toggle()
            }
            Spacer()
            StateObjectCountView()
            Spacer()
            ObservedObjectCountView()
            Spacer()
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

// @ObservedObjectを付与したデータオブジェクトを持つ構造体を定義
struct ObservedObjectCountView: View {
    @ObservedObject private var dataSource = DataSource()

    var body: some View {
        VStack {
            Text("ObservedObject count: \(dataSource.count)")
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
