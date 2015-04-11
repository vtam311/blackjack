assert = chai.assert

describe 'app', ->
  app = null
  king = null
  queen = null
  seven = null

  beforeEach ->
    king = new Card
      rank: 0
      suit: 3
    queen = new Card
      rank: 12
      suit: 3
    seven = new Card
      rank: 7
      suit: 3


  describe 'getWinner', ->
    app = new App()
    it 'should print out the correct winner', ->
      app.set 'playerHand', new Hand [king, queen]
      app.set 'dealerHand', new Hand [seven, queen]
      assert app.getWinner() == "player wins"
    it 'should detect a tie', ->
      app.set 'dealerHand', new Hand [king, queen]
      assert app.getWinner() is "tie"
