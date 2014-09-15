# For more information see: http://emberjs.com/guides/routing/

Converzilla.Router.map ()->
  @resource 'js_script'
  @resource 'operators', ->
    @route 'new'
    @route 'edit'
    @route 'show', {path: ':guid'}


  @resource 'inquires', ->
    @route 'update'
    @route 'edit'
    @route 'show', {path: ':guid'}
