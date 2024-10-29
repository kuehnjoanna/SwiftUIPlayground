import SwiftUI

enum MoveDirection {
    case toRight
    case toLeft
}

struct CardBraid: View {
    @State private var isClicked: Bool = false
    @State private var items: [CardBraidModel] = cardColors
    @State private var selectedItem: CardBraidModel? = nil  // Track the selected item
    @State private var movedItems: [CardBraidModel] = []
    @State private var animationCompleted = false  // Track animation completion
    @State private var moveHistory: [(CardBraidModel, MoveDirection)] = []
    @Namespace var namespace
    
    var body: some View {
        HStack {
            VStack {
                ZStack {
                    ForEach(items) { item in
                        if selectedItem != item || !isClicked {  // Display item only if it's not selected or not clicked
                            RoundedRectangle(cornerRadius: 25)
                                .fill(item.color)
                                .frame(width: 100, height: 100)
                                .zIndex(selectedItem == item ? 1 : 0)
                                .matchedGeometryEffect(id: item.id, in: namespace)  // Unique identifier for animation
                                .onTapGesture {
                                    withAnimation(.easeInOut) {  // Set animation duration
                                        selectedItem = item  // Set selected item
                                        isClicked = true
                                        animationCompleted.toggle()  // Trigger animation completion toggle
                                        moveItemToOtherStack(item: item)
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        // Move item to the second stack
                                        if let selectedItem = selectedItem {
                                            movedItems.append(selectedItem)  // Add to second stack
                                            items.removeAll { $0.id == selectedItem.id }  // Remove from first stack
                                            self.selectedItem = nil
                                            isClicked = false
                                        }
                                    }
                                    
                                }
                        }
                    }
                }
                
                Button("Rotate Colors") {
                    withAnimation(.easeInOut(duration: 0.5)) {
                  
                            items.append(items.removeFirst())  // Rotate the colors
                            animationCompleted.toggle()  // Trigger animation completion toggle
                        
                    }
                }   .disabled(items.isEmpty)
                
                // Back Button to Reverse Last Move
                Button("Back") {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        reverseLastMove()
                    }
                }
                .disabled(moveHistory.isEmpty)
            }
            .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height)
            .background(Color.green)
            
            VStack {
                HStack{
                    ForEach(movedItems) { item in
                        // Display each item moved to this stack
                        RoundedRectangle(cornerRadius: 25)
                            .fill(item.color)
                            .frame(width: 100, height: 100)
                            .visualEffect { content, geometryProxy in
                                content
//                                    .scaleEffect(scale(geometryProxy, scale: 0.1), anchor: .trailing)
                                    .rotationEffect(rotation(geometryProxy, rotation: -15 ))
                             //       .offset(x: minX(geometryProxy))
                           //         .offset(x: excessMinX(geometryProxy, offset: 8))
                                
                            }
                            .matchedGeometryEffect(id: item.id, in: namespace)  // Unique identifier for animation
                    }
                    
                    //                if let selectedItem = selectedItem, isClicked {
                    //                    // Display selected item in this VStack when clicked
                    //                    RoundedRectangle(cornerRadius: 25)
                    //                        .fill(selectedItem.color)
                    //                        .frame(width: 100, height: 100)
                    //                        .matchedGeometryEffect(id: "\(selectedItem.id)-\(isClicked)", in: namespace)  // Unique identifier for animation
                    //
                    //                }
                    Spacer()
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height)
            .background(Color.red)
        }
        .frame(height: UIScreen.main.bounds.height)
    }
    
//taken from stacked card view
    //Stacked Cards Animation
    func minX(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.frame(in: .scrollView(axis: .horizontal)).minX
        return minX < 0 ? 0 : -minX
    }

    // Function to move the tapped item to the movedItems stack
    private func moveItemToOtherStack(item: CardBraidModel) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
            movedItems.append(item)
            selectedItem = nil
            isClicked = false
            moveHistory.append((item, .toRight))  // Log the move to history
        }
    }
    func progress(_ proxy: GeometryProxy, limit: CGFloat = 2) -> CGFloat{
        let maxX = proxy.frame(in: .scrollView(axis: .horizontal)).maxX
        let width = proxy.bounds(of: .scrollView(axis: .horizontal))?.width ?? 0
        //converting into progress
        let progress = (maxX / width) - 1.0
        let cappedProgress = min(progress, limit)
        
        return cappedProgress
    }
    
    func excessMinX(_ proxy: GeometryProxy, offset: CGFloat = 10) -> CGFloat {
        let progress = progress(proxy)
        
        return progress * offset
    }
    
    func rotation(_ proxy: GeometryProxy, rotation: CGFloat = 5) -> Angle {
        let progress = progress(proxy)
        
        return .init(degrees: progress * rotation)
    }
    func scale (_ proxy: GeometryProxy, scale: CGFloat = 0.1) -> CGFloat{
        let progress = progress(proxy, limit: 4)
        return 1 - (progress * scale)
    }
    //end
    // Function to reverse the last move
      private func reverseLastMove() {
          guard let lastMove = moveHistory.popLast() else { return }  // Get and remove the last move
          
          switch lastMove.1 {
          case .toRight:
              if let index = movedItems.firstIndex(of: lastMove.0) {
                  movedItems.remove(at: index)
                  items.append(lastMove.0)  // Move item back to the original stack
              }
          case .toLeft:
              if let index = items.firstIndex(of: lastMove.0) {
                  items.remove(at: index)
                  movedItems.append(lastMove.0)  // Move item back to the movedItems stack
              }
          }
      }
    
    
}


#Preview {
    CardBraid()
}
