{ element, attr, text } = require('../../lib/cruftlesser')()

describe 'the descriptor', ->

  it 'should correctly handle a simple reference', ->
    expect(element('foo').content(
      text().bind('a')
    ).descriptor()).toEqual( {"keys": {"a": {"type": "string"}}, "type": "object"})

  it 'should correctly handle a nested reference', ->
    expect(element('foo').bind('a').content(
      text().bind('b')
    ).descriptor()).toEqual({"keys": {"a": {"keys": {"b": {"type": "string"}}, "type": "object"}}, "type": "object"})

  it 'should handle a nested array reference', ->
    expect(element('foo').content(
      text().bind('a[0].b')
    ).descriptor()).toEqual({"keys": {"a": {"element": {"keys": {"b": {"type": "string"}}, "type": "object"}, "type": "array"}}, "type": "object"})    

  it 'should correctly handle a nested array reference', ->
    expect(element('foo').bind('a').content(
      element('bar').bind('b').array().content(
        text().bind('c')
      )
    ).descriptor()).toEqual({"keys": {"a": {"keys": {"b": {"element": {"keys": {"c": {"type": "string"}}, "type": "object"}, "type": "array"}}, "type": "object"}}, "type": "object"})
  
  it 'should handle conditionals', ->
    expect(element('foo').content(
      element('bar').if('a').content(
        text().bind('b')
      )
    ).descriptor()).toEqual({"keys": {"a": {"type": "any"}, "b": {"type": "string"}}, "type": "object"})

  it 'should handle examples', ->
    expect(element('foo').content(
      text().bind('a').sample('bling')
    ).descriptor()).toEqual({"keys": {"a": {"sample": "bling", "type": "string"}}, "type": "object"})

  it 'should conver example values', ->
    expect(element('foo').content(
      text().bind('a').integer().sample('2')
    ).descriptor()).toEqual({"keys": {"a": {"sample": 2, "type": "integer"}}, "type": "object"})



    