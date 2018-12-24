{ element, attr, text } = require '../../src/model/model'

describe 'element', ->

  it 'should allow you to extract values from an XML string', ->
    el = element('foo').content(
      text().bind('a')
    )
    expect(el.fromXML('<foo>3</foo>')).toHaveProperty 'a', '3'