# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

updateCountdown = ->
  _tweet = $ '#text'
  _tweetCount = $ '#text-count'
  _tweetButton = $ '#tweet-button'

  current_length = _tweet.val().length


  _tweetCount.text current_length
  return

$ ->
  $ '#text'
    .ready updateCountdown
    .change updateCountdown
    .keyup updateCountdown
  return


