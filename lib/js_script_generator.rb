module JsScriptGenerator
  def JsScriptGenerator.get(client_id)
    str =
%Q[<link href="//#{Converzilla::Application.config.host}/assets/public.css?body=1" media="all" rel="stylesheet">
<script src="//#{Converzilla::Application.config.host}/assets/public.js" type="text/javascript"></script>
<script type="text/javascript>
(function() {
  $(document).ready(function() {
    return new Converzilla('#{client_id}');
  });
}).call(this);</script>]
    str
  end
end