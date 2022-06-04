//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by mac on 2022-05-26.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = Int.random(in: 0...2)
    @State private var status = Bool.random()
    @State private var alert = ""
    @State private var score = 0
    @State private var round = 1
    @State private var currentScore = 0
    @State private var showingAlert = false
    let symbols = ["✊","🖐","✌️"]
    
    var body: some View {
        
        VStack {
            Text("Rock Paper Scissor")
                .font(.system(size: 40))
                .bold()
                .foregroundColor(.yellow)
                
            Text(status ? "Play to win":"Play to lose")
                .font(.system(size: 30))
                .padding(.top,2)
                
            

            Text("App")
                .bold()
                .position(x: 100, y: 50)
                .font(.system(size: 25))
                
            Text("Round: \(round)")
                .bold()
                .position(x: 350, y: 30)
                .font(.system(size: 25))
            
            
            Text(symbols[selected])
                .font(.system(size: 200))
            
            Spacer(minLength: 100)
            
            
            Text("Player")
                .bold()
                .position(x: 100, y: 0)
                .font(.system(size: 25))
            
            Text("Score: \(score)")
                .bold()
                .font(.system(size: 25))
            
            HStack {
                ForEach(symbols, id:\.self) { item in
                    Button {
                        btnTapped(item)
                        
                    } label: {
                        Text(item)
                            .font(.system(size: 100))
                    }
                }
            }
            Spacer(minLength: 10)
            
        }
        .frame(width: 500)
        .background(.black)
        .foregroundColor(.white)
        .alert(alert, isPresented: $showingAlert){
            Button("Continue",action: new)
        } message: {
            Text("Your score is \(currentScore) ")
        }
    }
    func new(){
        if round == 10 {
            round = 0
            score = 0
        }
        selected = Int.random(in: 0...2)
        status = Bool.random()
        round += 1
         
    }
    
    func btnTapped(_ item: String){
        if selected == 0 && status == true {
            if item == "🖐" {
                alert = "Correct"
                currentScore = 1
                score += 1
            } else {
                alert = "Wrong"
                currentScore = 0
                score -= 1
            }
        }
        if selected == 0 && status == false {
            if item == "🖐" {
                alert = "Wrong"
                currentScore = 0
                score -= 1
            } else {
                alert = "Correct"
                currentScore = 1
                score += 1
            }
        }
        
        if selected == 1 && status == true {
            if item == "✌️" {
                alert = "Correct"
                currentScore = 1
                score += 1
            } else {
                alert = "Wrong"
                currentScore = 0
                score -= 1
            }
        }
        if selected == 1 && status == false {
            if item == "✌️" {
                alert = "Wrong"
                currentScore = 0
                score -= 1
            } else {
                alert = "Correct"
                currentScore = 1
                score += 1
            }
        }
        
        if selected == 2 && status == true {
            if item == "✊" {
                alert = "Correct"
                currentScore = 1
                score += 1
            } else {
                alert = "Wrong"
                currentScore = 0
                score -= 1
            }
        }
        if selected == 2 && status == false {
            if item == "✊" {
                alert = "Wrong"
                currentScore = 0
                score -= 1
            } else {
                alert = "Correct"
                currentScore = 1
                score += 1
            }
        }
        showingAlert = true
    }
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//Text("✊🖐✌️")
