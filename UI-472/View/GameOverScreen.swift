//
//  GameOverScreen.swift
//  UI-472
//
//  Created by nyannyan0328 on 2022/02/20.
//

import SwiftUI

struct GameOverScreen: View {
    
    @State var startOffset : [CGSize] = Array(repeating: CGSize(width: 0, height: -UIScreen.main.bounds.height), count: 11)
    
    @State var skeletonRotains : [Angle] = Array(repeating: .init(degrees: 0), count: 11)
    
    @State var rotatedOffset : [CGSize] = Array(repeating: .zero, count: 11)
    
    
    @State var gameOver : Bool = false
    var body: some View {
        ZStack{
            
            Color.black
            
            
            VStack{
                
                
                VStack{
                    
                    
                    Image("Skeleton_1")
                        .renderingMode(.template)
                        .offset(startOffset[1])
                        .rotationEffect(skeletonRotains[1])
                        .offset(rotatedOffset[1])
                    
                    
                    Image("Skeleton_2")
                        .renderingMode(.template)
                        .offset(startOffset[2])
                      
                        .rotationEffect(skeletonRotains[2])
                        .offset(rotatedOffset[2])
                      
                    
                        .overlay(alignment: .top) {
                            
                            HStack{
                                
                                Image("Skeleton_6")
                                    .renderingMode(.template)
                                    .offset(startOffset[6])
                                    .offset(rotatedOffset[6])
                                    .rotationEffect(skeletonRotains[6])
                                 
                                
                                Spacer()
                                
                                VStack{
                                    
                                    Image("Skeleton_7")
                                        .renderingMode(.template)
                                        .offset(startOffset[7])
                                        .rotationEffect(skeletonRotains[7])
                                        .offset(rotatedOffset[7])
                                    
                                    Image("Skeleton_8")
                                        .renderingMode(.template)
                                        .padding(.top,-25)
                                        .offset(x: 6)
                                        .offset(startOffset[8])
                                        .rotationEffect(skeletonRotains[8])
                                        .offset(rotatedOffset[8])
                                     
                                    
                                    
                                    
                                }
                                
                                
                                
                            }
                            .padding(.horizontal,-40)
                            
                            
                            
                            
                        }
                    
                    Image("Skeleton_3")
                        .renderingMode(.template)
                        .offset(y: -10)
                        .offset(startOffset[3])
                        .rotationEffect(skeletonRotains[3])
                        .offset(rotatedOffset[3])
                        .overlay(alignment: .bottom) {
                            
                            HStack{
                                
                                VStack{
                                    
                                    Image("Skeleton_4")
                                        .renderingMode(.template)
                                        .offset(startOffset[4])
                                        .rotationEffect(skeletonRotains[4])
                                        .offset(rotatedOffset[4])
                                    
                                    Image("Skeleton_9")
                                        .renderingMode(.template)
                                        .padding(.top,-30)
                                        .offset(startOffset[9])
                                        .rotationEffect(skeletonRotains[9])
                                        .offset(rotatedOffset[9])
                                        
                                }
                                .offset(x: -20, y: -8)
                                
                                Spacer()
                                
                                VStack{
                                    
                                    Image("Skeleton_5")
                                        .renderingMode(.template)
                                        .offset(startOffset[5])
                                        .rotationEffect(skeletonRotains[5])
                                        .offset(rotatedOffset[5])
                                    
                                    Image("Skeleton_10")
                                        .renderingMode(.template)
                                        .padding(.top,-30)
                                        .offset(startOffset[10])
                                        .rotationEffect(skeletonRotains[10])
                                        .offset(rotatedOffset[10])
                                }
                                .offset(x: 20, y: -8)
                                
                                
                                
                            }
                            .offset(y: 160)
                            
                            
                        }
                        
                }
                .foregroundColor(.white)
                .scaleEffect(rotatedOffset[1].width == 0 ? 1 : 0.8)
                
                
                if rotatedOffset[1].width != 0{
                    
                    Text("GameOver")
                        .font(.custom("Game Over", size: 160))
                        .foregroundColor(.white)
                        .padding(.top,100)
                        .opacity(gameOver ? 1 : 0)
                        
                }
                
                
            }
            .padding(.bottom,startOffset[1].width == 0 ? 160 :  0)
        }
        .ignoresSafeArea()
        .onAppear {
            initialAnimation()
        }
    }
    func initialAnimation(){
        
        
        
        (1...10).forEach { index in
            
            
            withAnimation(.easeInOut(duration: 0.2).delay(Double(index / 40))){
                
                
                startOffset[11 - index] = .zero
                
            }
        }
        
        (1...10).forEach { index in
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6).speed(1.3)){
                
                
                skeletonRotains[index] = .init(degrees:rotations[index - 1])
                self.rotatedOffset[index] = rotatedOffsets_[index - 1]
                
                
                
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            
            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)){
                
               
                    
                    gameOver.toggle()
            
                
            }
            
            
        }
            
        
        
    }
    
}

struct GameOverScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameOverScreen()
    }
}

let rotations: [Double] = [-23,-17,-7,27,-21,-105,-82,-110,10,-4]

let rotatedOffsets_: [CGSize] = [

    CGSize(width: -35, height: 12),
    CGSize(width: -6,height: 0),
    CGSize(width: 12, height: 0),
    CGSize(width: 0, height: 0),
    CGSize(width: 25, height: 0),
    CGSize(width: 55, height: 80),
    CGSize(width: 5, height: -60),
    CGSize(width: 102, height: -172),
    CGSize(width: -25, height: 0),
    CGSize(width: 45, height: 0),
]

