# For more information see: http://emberjs.com/guides/routing/

Converzilla.Router.map ()->
  @resource 'operators', ->
    @route 'new'
    @route 'edit'
    @route 'show', {path: ':guid'}


