class Myapp.Routers.BookmarksRouter extends Backbone.Router
  initialize: (options) ->
    @bookmarks = new Myapp.Collections.BookmarksCollection()
    @bookmarks.reset options.bookmarks

  routes:
    "new"       : "newBookmark"
    "index"     : "index"
    "search/:id": "search"
    "search"    : "search"
    ":id/edit"  : "edit"
    ":id"       : "show"
    ".*"        : "index"

  newBookmark: ->
    @view = new Myapp.Views.Bookmarks.NewView(collection: @bookmarks)
    $("#bookmarks").html(@view.render().el)
    $('.tags').tagsInput();

  index: ->
    @view = new Myapp.Views.Bookmarks.IndexView(bookmarks: @bookmarks)
    $("#bookmarks").html(@view.render().el)

  search: (id)->
    Accounts = new Backbone.Collection;
    Accounts.url = '/bookmarks/search/' + id;
    Accounts.fetch();   
    @view = new Myapp.Views.Bookmarks.SearchView(bookmarks: Accounts)
    $("#bookmarks").html(@view.render().el)
    $("#qSpan").html(lastQuery)

  show: (id) ->
    bookmark = @bookmarks.get(id)
    @view = new Myapp.Views.Bookmarks.ShowView(model: bookmark)
    $("#bookmarks").html(@view.render().el)

  edit: (id) ->
    bookmark = @bookmarks.get(id)

    @view = new Myapp.Views.Bookmarks.EditView(model: bookmark)
    $("#bookmarks").html(@view.render().el)
    $('.tags').tagsInput();
