//
//  SwitchColorView.swift
//  PracticePropertyWrapper
//
//  Created by Johnny Toda on 2023/05/02.
//

import SwiftUI

// ボタンをタップするとサークルのカラーが切り替わるViewを定義
struct SwitchColorView: View {
    // 値型のデータをView自身に保持させるnode@Stateを使用
    @State private var isFire = false

    var body: some View {
        VStack {
            Spacer()
            Text("親View")
            // true = 赤色, false = 緑色
            isFire == true ?
            // systemImage以外のサイズ変更処理
//            Image("Hoge")
            // SwiftUIでImageを任意のサイズで表示したい場合はresizableを使用する必要あり
//                .resizable()
//                .frame(width: 200, height: 200)

            Image(systemName: "flame")
                .font(.system(size: 200))
                .foregroundColor(.none)
            :
            Image(systemName: "flame.fill")
                .font(.system(size: 200))
                .foregroundColor(.red)
//            isChecked == true ? Circle().foregroundColor(.red)
//                .frame(width: 200, height: 200) :
//            Circle().foregroundColor(.green)
//                .frame(width: 200, height: 200)

            // 処理を実行するとデータに変更が加えられる為,bodyが再描画される
            // bodyが再描画されると@ObservedObjectのライフサイクルが呼ばれる
            Button("Change") {
                // isDangerのBool値を反転させる
                isFire.toggle()
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
            Text("子View")
            Text("StateObject count: \(dataSource.count)")
            Button("increment") {
                dataSource.count += 1
            }
//            ObservedObjectCountView(dataSource: dataSource)
        }
    }
}

// @ObservedObjectを付与したデータオブジェクトを持つ構造体を定義
struct ObservedObjectCountView: View {
    // 本来ObservedObjectは親Viewから渡されるデータを参照する場合のみ用いる
    //    @ObservedObject var dataSource: DataSource
    //自身でデータオブジェクトを保持すべきではない。
    @ObservedObject private var dataSource = DataSource()

    var body: some View {
        VStack {
            Text("子View")
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
