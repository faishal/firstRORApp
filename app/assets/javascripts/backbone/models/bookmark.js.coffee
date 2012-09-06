class Myapp.Models.Bookmark extends Backbone.Model
  paramRoot: 'bookmark'

  defaults:
    title: null
    details: null
    burl:null
class Myapp.Collections.BookmarksCollection extends Backbone.Collection
  model: Myapp.Models.Bookmark
  url: '/bookmarks'

