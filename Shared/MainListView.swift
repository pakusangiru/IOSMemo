//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by park sangil on 2023/02/20.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                VStack(alignment:.leading) {
                    Text(memo.content)
                    font(.body)
                        .lineLimit(1)
                    
                    Text(memo.insertDate,style:  .date)
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
            }
            .listStyle(.plain)
            .navigationTitle("私のメモ")
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}
