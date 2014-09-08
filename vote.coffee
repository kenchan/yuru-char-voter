system = require('system')
casper = require('casper').create()

casper.start 'http://www.yurugp.jp/vote/detail.php?id=' + system.env.CHARACTER_ID, ->
  console.log @evaluate ->
    document.querySelector("h3").innerHTML

  @click('input[type=image]')

casper.then ->
  @fillSelectors(
    'form.inputBox', {
      '#mailaddress': system.env.EMAIL,
      '#password': system.env.PASSWORD
    },
    true
  )

casper.then ->
  console.log @evaluate ->
    document.querySelector("title").innerHTML

casper.run()
