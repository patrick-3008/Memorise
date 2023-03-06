// VIEW-MODEL

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        var emojis: Array<String> = []
        for _ in 0...10 {
            emojis.append(String(UnicodeScalar(Int.random(in: 0x1F601...0x1F64F)) ?? "-"))
        }
        return MemoryGame<String>(numberOfPairOfCards: 10) { pairIndex in
            return emojis[pairIndex]
        }
    }
       
    func isEndGame() -> Bool {
        return model.isEndGame
    }
    
    func newGame() -> Void {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func isOutOfMoves() -> Bool {
        model.isOutOfMoves
    }
    // MARK: - Access to Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func chooseVM(card: MemoryGame<String>.Card) {
        model.chooseM(card: card)
    }
    
    func showBouns() -> Int {
        model.bounsScore
    }
    
    func showMoves() -> Int {
        model.movesLeft
    }
    
    func minusMove() {
        if model.movesLeft > 0 {
            model.movesLeft -= 1
        } else {
            return
        }
    }
}
