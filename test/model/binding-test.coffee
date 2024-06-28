expr = require '../../lib/model/binding'

describe 'the expr parser', ->

  it 'should parse an expression correctly', ->
    expect(expr.curly('{{a.b.c}}').parsed).toEqual ['a.b.c']

  it 'should consider an illegal expression to be undefined', ->
    expect(expr.curly('foo').parsed).toBeUndefined()

  it 'should find modifiers', ->
    expect(expr.curly('{{a.b.c|foo|bar}}').parsed).toEqual ['a.b.c', 'foo', 'bar']    

      