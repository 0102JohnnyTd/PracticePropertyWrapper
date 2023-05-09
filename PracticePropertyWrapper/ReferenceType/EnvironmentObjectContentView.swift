//
//  EnvironmentObjectContentView.swift
//  PracticePropertyWrapper
//
//  Created by Johnny Toda on 2023/05/05.
//

import SwiftUI




//struct EnvironmentObjectContentView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}


struct ParentView: View {

//    @StateObject private var dataSource = DataSource()
    // 🍏単純にPreviewでDataSourceクラスのインスタンス生成して値を共有したい親Viewと孫Viewに@EnviromentObjectを付与したデータオブジェクトのプロパティを定義するだけでOK
    @EnvironmentObject private var dataSource: DataSource

    var body: some View {
        VStack {
            // 1️⃣staticプロパティにアクセスしてcountを+1するもViewでは変化しない。
            Text("Parent view count: \(dataSource.count)")
            Button("increment") {
                dataSource.count += 1
            }
            ChildView()
        }
    }
}

struct ChildView: View {
    var body: some View {
        Text("Child view count: \(0)")
        GrandChildView()
    }
}

struct GrandChildView: View {
    @EnvironmentObject var dataSource: DataSource
    var body: some View {
        VStack {
            Text("Grrand child view count: \(dataSource.count)").border(Color.red)
        }
    }
}

struct DataFlowSampleApp_Previews: PreviewProvider {
    // 0️⃣このインスタンスのcountプロパティの値をParentViewで編集する方法が分からない。
    @StateObject static var dataSource = DataSource()
//    @StateObject static private var dataSource = DataSource()
    static var previews: some View {
        ParentView().environmentObject(dataSource)
    }
}
