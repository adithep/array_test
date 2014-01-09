reactive_input =
  _dep: new Deps.Dependency()
  _value: {}
  get: (v) ->
    this._dep.depend()
    this._value[v]

  spush: (v, t) ->
    if this._value[v] is undefined
      this._value[v] = []

    this._value[v].push(t)

    this._value[v].map (doc, index) ->
      doc.index = index
      doc.index

    this._dep.changed()
  spop: (v, t) ->
    this._value[v].splice(t, 1)
    this._value[v].map (doc, index) ->
      doc.index = index
      doc.index
    this._dep.changed()

Template.main.events
  'click .add_data': (evt, t) ->
    reactive_input.spush("test", {input_name: "me"})
  'click .add_template': (evt, t) ->
    reactive_input.spush("test1", {templatet: Template.an})
Template.main.helpers
  data: ->
    reactive_input.get("test")
  template: ->
    reactive_input.get("test1")