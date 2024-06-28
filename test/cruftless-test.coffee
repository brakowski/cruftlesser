describe 'template', ->

  special =
    desc: type: 'boolean'
    from: (str) -> str is 'True'
    to: (value) -> if value then 'True' else 'False'

  it 'should allow you to customize the types', ->
    
    { element, attr, text } = require('../lib/cruftlesser')({
      types: { special }
    })      

    el = element('foo').content(
      text().bind('a').special()
    )
    expect(el.toXML({ a: true })).toEqual('<foo>True</foo>')
    expect(el.fromXML('<foo>False</foo>')).toEqual({ a: false })
    
  it 'should allow you to customize the types', ->    
    { parse } = require('../lib/cruftlesser')({
      types: { special }
    })      
    el = parse('<foo>{{a|special}}</foo>')
    expect(el.toXML({ a: true })).toEqual('<foo>True</foo>')
    expect(el.fromXML('<foo>False</foo>')).toEqual({ a: false })
  