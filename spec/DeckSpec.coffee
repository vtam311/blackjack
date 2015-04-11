assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()


  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

  describe 'stand', ->
    it 'should make dealer hit until 17', ->
      dealerHand = deck.dealDealer()
      dealerHand.stand()
      assert dealerHand.getHighestValidScore() > 16 or dealerHand.getHighestValidScore() < 0

  describe "score", ->
    it 'should properly calculate score', ->
      ace = new Card
        rank: 1
        suit: 3
      king = new Card
        rank: 0
        suit: 3
      testHand = new Hand [ace, king]
      assert testHand.scores()[0] is 11 and testHand.scores()[1] is 21, "scores not valid"
