# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

MAX_TWEET_LENGTH = 140

updateCountdown = ->
  _tweet = $ '#text'
  _tweetCount = $ '#text-count'
  _tweetButton = $ '#tweet-button'

  current_length = MAX_TWEET_LENGTH - _tweet.val().length

  if current_length > -1
    _tweetButton.removeAttr 'disabled'
  else
    _tweetButton.attr 'disabled', 'disabled'

  _tweetCount.text current_length
  return

$ ->
  $ '#text'
    .ready updateCountdown
    .change updateCountdown
    .keyup updateCountdown
  return


