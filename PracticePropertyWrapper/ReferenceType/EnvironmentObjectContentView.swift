//
//  EnvironmentObjectContentView.swift
//  PracticePropertyWrapper
//
//  Created by Johnny Toda on 2023/05/05.
//

import SwiftUI




struct EnvironmentObjectContentView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


struct ParentView: View {
//    @StateObject private var dataSource = DataSource()

    var body: some View {
        VStack {
            Text("Parent view count: \(DataFlowSampleApp_Previews.dataSource.count)")
            Button("increment") {
                DataFlowSampleApp_Previews.dataSource.count += 1
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
            Text("Grrand child view count: \(0)")
            Text("\(dataSource.count)").border(Color.red)
        }
    }
}

struct DataFlowSampleApp_Previews: PreviewProvider {
    @StateObject static var dataSource = DataSource()
//    @StateObject static private var dataSource = DataSource()
    static var previews: some View {
        ParentView().environmentObject(dataSource)
    }
}
