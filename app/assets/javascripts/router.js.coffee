# For more information see: http://emberjs.com/guides/routing/

Converzilla.Router.map ()->
  @resource 'operators', ->
    @resource 'new'
    @resource 'edit'
    @resource 'show', {path: ':guid'}


