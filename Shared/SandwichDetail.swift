//
//  SandwichDetail.swift
//  Sandwiches
//
//  Created by chino on 2020/11/15.
//

import SwiftUI

struct SandwichDetail: View {
    let sandwich: Sandwich
    @State private var zoomed = false
    
    var body: some View {
        VStack {
            Spacer(minLength: 0)
            Image(sandwich.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation { zoomed.toggle() }
                }
            Spacer(minLength: 0)
            if sandwich.isSpicy && !zoomed {
                HStack {
                    Spacer()
                    Label("Spicy", systemImage: "flame.fill")
                    Spacer()
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .font(Font.headline.smallCaps())
                 .background(Color.red)
                .foregroundColor(.yellow)
                .transition(.move(edge: .bottom))
            }
        }
        .navigationTitle(sandwich.name)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                SandwichDetail(sandwich: testData[0])
            }
            NavigationView {
                SandwichDetail(sandwich: testData[1])
            }
        }
    }
}
