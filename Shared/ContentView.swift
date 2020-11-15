//
//  ContentView.swift
//  Shared
//
//  Created by chino on 2020/11/15.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: SandwichStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.sandwiches) { sandwich in
                    SandwichCell(sandwich: sandwich)
                }
//                .onMove(perform: moveSandwich)
//                .onDelete(perform: deleteSandwich)
                .onMove(perform: { indices, newOffset in
                    moveSandwich(from: indices, to: newOffset)
                })
                .onDelete(perform: { indexSet in
                    deleteSandwich(offsets: indexSet)
                })
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Sandwiches")
            .toolbar {
                HStack {
                    Button("Add", action: makeSandwich)
                        .padding(.trailing)
                    #if os(iOS)
                    EditButton()
                    #endif
                }
            }
            Text("Select a sandwich")
                .font(.largeTitle)
        }
    }
    
    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(Sandwich(name: "Patty melt", indigrientCount: 3))
        }
    }
    
    func moveSandwich(from: IndexSet, to: Int) {
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }
    
    func deleteSandwich(offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: testStore)
            ContentView(store: testStore)
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ContentView(store: testStore)
                .preferredColorScheme(.dark)
        }
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)) {
            Image(sandwich.thumbnailName)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(sandwich.name)
                Text("\(sandwich.indigrientCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
