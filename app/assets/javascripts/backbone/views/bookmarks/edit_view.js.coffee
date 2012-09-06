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
      error: (bookmark, jqXHR) =>
        jerrors =$.parseJSON(jqXHR.responseText)
        strHTML=""
        sep=""
        for key, value of jerrors
          strHTML += sep + value
          sep="<br/>"
        this.$("#errorDetail").html(strHTML);
        this.$("#alert").css("display","");

    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))
    this.$("form").backboneLink(@model)
    return this
