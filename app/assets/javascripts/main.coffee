# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

updateCountdown = ->
  _body = $ '#body'
  _bodyCount = $ '#text-count'
  _bodyButton = $ '#body-button'


  current_length = _body.val().length

  _bodyCount.text current_length
  return

$ ->
  $ '#body'
    .ready updateCountdown
    .change updateCountdown
    .keyup updateCountdown
  return
