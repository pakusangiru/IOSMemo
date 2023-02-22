//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by park sangil on 2023/02/22.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer: Bool = false
    
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                MemoCell(memo: memo)
            }
            .listStyle(.plain)
            .navigationTitle("私のメモ")
            .toolbar{
                Button{
                    showComposer = true
                    }label: {
                        Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showComposer){
                ComposeView()
            }
        }
        
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
        
    }
}
