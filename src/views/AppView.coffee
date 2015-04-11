class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="winner"></div>
  '

  events:
    'click .hit-button': ->
      @model.get('playerHand').hit()
      if @model.get('playerHand').getHighestValidScore() < 0
        @model.get('dealerHand').stand()
        @displayWinner()
    'click .stand-button': ->
      @model.get('dealerHand').stand()
      @displayWinner()

  initialize: ->
    @render()

  displayWinner: ->
    # @model.getWinner()
    @$el.find('.winner').text(@model.getWinner())

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

