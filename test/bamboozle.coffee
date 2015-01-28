chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'hubot-bamboozle', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/bamboozle')(@robot)

  describe 'specials', ->
    it 'registers a respond listener for "bamboozle me"', ->
      expect(@robot.respond).to.have.been.calledWith(/bamboozle me\b/i)
    it 'returns a string', ->
      # coming soon
