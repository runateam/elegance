{{ $req := . }}

<div class="headling row">
  <h4 id="request-{{ slugify $req.Name }}">
    {{ $req.Name }}
    <a href="#request-{{ slugify $req.Name }}"><i class="glyphicon glyphicon-link"></i></a>
  </h4>
</div>

<div class="description">{{ markdown $req.Description }}</div>

<div class="basics">
  <div class="url row">
    <h5>HTTP Request</h5>
    <div class="col-xs-12">
      <code><span class="req-{{ $req.Method }} text-lg">{{ $req.Method }}</span> {{ $req.URL }}</code>
    </div>
  </div>

  <div class="headers row">
    <h5>Headers</h5>
    <dl class="dl-horizontal col-xs-12">
      {{ range $req.Headers }}
        <dt class="name col-md-3 col-xs-12">{{ .Name }}</dt>
        <dd class="value col-md-9 col-xs-12">{{ .Value }}</dd>
      {{ end }}
    </dl>
  </div>

  <div class="payload row">
    <h5>PayLoad</h5>
    <div class="col-xs-12">
      {{ with $payload := indentJSON $req.PayloadRaw }}
        <pre><code>{{ $payload }}</code></pre>
      {{ end }}
    </div>
  </div>
</div>

<div class="request examples clearfix">
  <h5>Example</h5>

  <!-- BEGIN example requests -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#request-{{ slugify $req.Name }}-example-curl" data-toggle="tab">Curl</a></li>
    <li role="presentation"><a href="#request-{{ slugify $req.Name }}-example-http" data-toggle="tab">HTTP</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="request-{{ slugify $req.Name }}-example-curl">
      <pre><code class="hljs curl">{{ curlSnippet $req }}</code></pre>
    </div>
    <div class="tab-pane" id="request-{{ slugify $req.Name }}-example-http">
      <pre><code class="hljs http">{{ httpSnippet $req }}</code></pre>
    </div>
  </div>
  <!-- END example requests -->

  <!-- BEGIN example responses -->
  {{ with $req.Responses }}
  <ul class="nav nav-tabs" role="tablist">
    {{ range $index, $res := . }}
    <li role="presentation" {{ if eq $index 0 }} class="active" {{ end }}>
      <a href="#request-{{ slugify $req.Name }}-responses-{{ $res.ID }}" data-toggle="tab">
        {{ if eq (len $req.Responses) 1 }} Response {{ else}} {{ $res.Name }} {{ end }}
      </a>
    </li>
    {{ end }}
  </ul>

  <div class="tab-content">
    {{ range $index, $res := . }}
    <div class="tab-pane{{ if eq $index 0 }} active{{ end }}" id="request-{{ slugify $req.Name }}-responses-{{ $res.ID }}">

      <span class="status status-{{ $res.StatusCode }}">Status {{ $res.StatusCode }}</span> {{ $res.Status }}
      {{ if hasContent $res.Body }}
        {{ with $example := indentJSON $res.Body }}
          <pre><code>{{ $example }}</code></pre>
        {{ end }}
      {{ end }}
    </div>
    {{ end }}
  </div>
  {{ end }}
  <!-- END example responses -->
</div>
