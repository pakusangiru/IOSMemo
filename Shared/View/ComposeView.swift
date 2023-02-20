//
//  ComposeView.swift
//  SwiftUIMemo
//
//  Created by park sangil on 2023/02/20.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    
    @Environment(\.dismiss) var dismiss
    
    @State private var content: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content)
                    .padding()
            }
            .navigationTitle("新しいメモ")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading)
                {
                    Button {
                        dismiss()
                    } label: {
                        Text("キャンセル")
                    }
                }
                
                
                ToolbarItemGroup(placement: .navigationBarTrailing)
                {
                    Button {
                        store.insert(memo: content)
                        
                        dismiss()
                    } label: {
                        Text("保存")
                    }
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
