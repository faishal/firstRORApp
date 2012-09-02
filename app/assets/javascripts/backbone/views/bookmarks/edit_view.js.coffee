Myapp.Views.Bookmarks ||= {}

class Myapp.Views.Bookmarks.EditView extends Backbone.View
  template : JST["backbone/templates/bookmarks/edit"]

  events :
    "submit #edit-bookmark" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.set({"details" : $(".tags")[0].value})
    @model.save(null,
      success : (bookmark) =>
        @model = bookmark
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    @model.set({silent:false})
    @model.change()
    this.$("form").backboneLink(@model)

    return this
