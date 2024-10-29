//
//  AnimatedCardView.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 28.10.24.
//

import SwiftUI

struct AnimatedCardView: View {
    @State var rotation: CGFloat = 0.0
    var body: some View {
        ZStack{
            Color.black
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
            //play with frame for different effects
                .frame(width:500, height: 290)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.purple.opacity(0.4), .blue, .blue, .purple.opacity(0.4)]), startPoint: .top, endPoint: .bottom))
                .rotationEffect(.degrees(rotation))
                .mask{
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(lineWidth: 7)
                        .frame(width: 256, height: 336)
                }
            
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 260, height: 340)
                .foregroundStyle(.black)
                .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y:0)
               // .rotationEffect(.degrees(rotation))
            RoundedRectangle(cornerRadius: 20, style: .continuous)
            //play with frame for different effects
                .frame(width:500, height: 200)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.purple.opacity(0.4), .blue, .blue, .purple.opacity(0.4)]), startPoint: .top, endPoint: .bottom))
                .rotationEffect(.degrees(rotation))
                .mask{
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(lineWidth: 7)
                        .frame(width: 256, height: 336)
                }
//            Text("CARD").bold()
//                .font(.largeTitle)
//                .foregroundStyle(.white)
            ScratchCard(width: 200, height: 200, backgroundColor: Color.green, corneredRadius: 20){
                Image("dog1").resizable().scaledToFill()
            }scratch: {
                //
            }

        }
        .ignoresSafeArea()
        .onAppear{
            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)){
                rotation = 360
            }
        }
    }
}

#Preview {
    AnimatedCardView()
}
struct ScratchCard<Gift: View, Scratch: View>: View {
    @State private var points: [CGPoint] = []
    @State private var isScratched: Bool = false
    @State private var scale: CGFloat = 1.0
    var width: CGFloat
    var height: CGFloat
    var backgroundColor: Color
    var corneredRadius: CGFloat
    var gift: Gift
    var scratch: Scratch
    private let scratchedThreshold: CGFloat = 1
    
    init(width: CGFloat, height: CGFloat, backgroundColor: Color, corneredRadius: CGFloat, @ViewBuilder gift: () -> Gift, @ViewBuilder scratch: () -> Scratch) {
        self.width = width
        self.height = height
        self.backgroundColor = backgroundColor
        self.corneredRadius = corneredRadius
        self.gift = gift()
        self.scratch = scratch()
    }
    var body: some View{
        ZStack{
            scratch
                .frame(width: width, height: height)
            Text("Scratch").foregroundStyle(.white).font(.title)
            Rectangle().foregroundStyle(.gray)
                .frame(width: width, height: height)
                .overlay{
                    gift
                        .frame(width: width, height: height)
                }
                .mask{
                    ScratchMaskView(points: $points, isScratched: $isScratched)
                        .frame(width: width, height: height)
                }
                .gesture(createScratchGesture())
        }
        .clipShape(.rect(cornerRadius: corneredRadius))
    }
    func createScratchGesture() -> some Gesture{
        let dragGesture = DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged{ value in
                points.append(value.location)
            }
        let topGesture = TapGesture()
            .onEnded{ value in
                if let firstLocation = points.first{
                    points.append(firstLocation)
                }
            }
        return dragGesture.simultaneously(with: topGesture)
    }
}
struct ScratchMaskView: View {
    @Binding var points: [CGPoint]
    @Binding var isScratched: Bool
    var body: some View{
        GeometryReader(content: { geometry in
            Canvas{ context, size in
                if isScratched{
                    context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(.black))
                } else {
                    for point in points {
                        let rect = CGRect(origin: CGPoint(x: point.x - 25, y: point.y - 25), size: CGSize(width: 50, height: 50))
                        context.fill(Path(ellipseIn: rect), with: .color(.black))
                    }
                }
            }
        })
    }
}
