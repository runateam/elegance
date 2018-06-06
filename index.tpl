<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="favicon.ico" rel=icon type="image/ico"/>
    <title>{{ .Name }}</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/tomorrow-night-eighties.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js"></script>
    <script>
        hljs.configure({
            tabReplace: '    ',
        });
        hljs.initHighlightingOnLoad();
    </script>
    <style>{{ template "custom.css" }}</style>
</head>
<body data-spy="scroll" data-target=".scrollspy">

  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-wrapper" aria-expanded="false">
    <span class="sr-only">Toggle navigation</span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
  </button>

<div id="sidebar-wrapper" class="collapse navbar-collapse">
  {{ template "menu.tpl" . }}
</div>

<div id="page-content-wrapper">
  <div class="split">
    <div class="left">
      <h2 id="doc-general-notes">
          General notes
          <a href="#doc-general-notes"><i class="glyphicon glyphicon-link"></i></a>
      </h2>

      {{ markdown .Description }}

      {{ template "structures.tpl" }}

      <h2 id="doc-api-detail">
          API detail
          <a href="#doc-api-detail"><i class="glyphicon glyphicon-link"></i></a>
      </h2>
    </div>

    <div class="right empty"></div>
  </div>

    {{ range .Requests }}
      { { template "request.tpl"  .}}
    {{ end }}

    {{ range .Folders }}
      {{ $folder := .}}
      {{ template "folders.tpl" $folder }}
    {{ end }}
</div>


<script src="https://code.jquery.com/jquery-2.2.2.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        $("table:not(.table)").addClass('table table-bordered');
    });
</script>
</body>
</html>
