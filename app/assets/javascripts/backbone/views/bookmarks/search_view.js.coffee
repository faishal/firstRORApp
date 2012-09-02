Myapp.Views.Bookmarks ||= {}

class Myapp.Views.Bookmarks.SearchView extends Backbone.View
  template: JST["backbone/templates/bookmarks/search"]

  initialize: () ->
    @options.bookmarks.bind('reset', @addAll)

  addAll: () =>
    @options.bookmarks.each(@addOne)

  addOne: (bookmark) =>
    view = new Myapp.Views.Bookmarks.BookmarkView({model : bookmark})
    console.log(view)
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(bookmarks: @options.bookmarks.toJSON() ))
    @addAll()

    return this
