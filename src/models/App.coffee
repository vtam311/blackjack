# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  getWinner: ->
    player = @get 'playerHand'
    dealer = @get 'dealerHand'

    playerScore = player.getHighestValidScore()
    dealerScore = dealer.getHighestValidScore()

    if playerScore > dealerScore
      "player wins"
    else if playerScore is dealerScore
      "tie"
    else
      "dealer wins"


