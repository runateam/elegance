<!-- BEGIN iterate through all groups -->
{{ $folder := . }}
<div class="endpoints-group">
  <div class="split">
    <div class="left">
      <div class="headling row">
        <h3 id="folder-{{ slugify $folder.Name }}">
          {{ .Name }}
          <a href="#folder-{{ slugify $folder.Name }}"><i class="glyphicon glyphicon-link"></i></a>
        </h3>
      </div>

      <div class="description">{{ markdown $folder.Description }}</div>
    </div>

    <div class="right empty"></div>
  </div>

  <!-- BEGIN iterate through all requests -->
  {{ range $folder.Requests }}
  {{ $req := . }}
    <div class="split">
      <div class="left">
        <div class="headling row">
          <h4 id="request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}">
            {{ $req.Name }}
            <a href="#request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}"><i class="glyphicon glyphicon-link"></i></a>
          </h4>
        </div>

        <div class="description">{{ markdown $req.Description }}</div>
      </div>

      <div class="right empty"></div>
    </div>

    <div class="split">
      <div class="left">
        <div class="url row">
          <h5>HTTP Request</h5>
          <div class="col-xs-12">
            <code><span class="req-{{ $req.Method }} text-lg">{{ $req.Method }}</span> {{ $req.URL }}</code>
          </div>
        </div>

        <div class="headers row">
          <h5>Headers</h5>
          {{ if ne (len $req.Headers) 0 }}
            <dl>
              {{ range $req.Headers }}
                <dt class="name col-md-3 col-xs-12">{{ .Key }}</dt>
                <dd class="value col-md-9 col-xs-12">{{ .Value }}</dd>
              {{ end }}
            </dl>
          {{ else }}
            <div class="col-xs-12"> None </div>
          {{ end }}
        </div>

        <div class="payload row">
          <h5>PayLoad</h5>
          <div class="col-xs-12">
            {{ if hasContent $req.PayloadRaw }}
              {{ with $payload := indentJSON $req.PayloadRaw }}
                <pre><code>{{ $payload }}</code></pre>
              {{ end }}
            {{ else }}
              None
            {{ end }}
          </div>
        </div>
      </div>

      <div class="right clearfix">
        <!-- BEGIN example requests -->
        <div class="request">
          <h5>Example request</h5>

          <ul class="nav nav-pills" role="tablist">
            <li role="presentation" class="active"><a href="#request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}-example-curl" data-toggle="tab">Curl</a></li>
            <li role="presentation"><a href="#request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}-example-http" data-toggle="tab">HTTP</a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}-example-curl">
              <pre><code class="hljs curl">{{ curlSnippet $req }}</code></pre>
            </div>
            <div class="tab-pane" id="request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}-example-http">
              <pre><code class="hljs http">{{ httpSnippet $req }}</code></pre>
            </div>
          </div>
        </div>
        <!-- END example requests -->

        <!-- BEGIN example responses -->
        {{ with $req.Responses }}
        <div class="response">
          <h5>Example response</h5>

          <ul class="nav nav-pills" role="tablist">
            {{ range $index, $res := . }}
            <li role="presentation" {{ if eq $index 0 }} class="active" {{ end }}>
              <a href="#request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}-responses-{{ $res.ID }}" data-toggle="tab">
                {{ if eq (len $req.Responses) 1 }}
                  Response
                {{ else }}
                  {{ $res.Name }}
                {{ end }}
              </a>
            </li>
            {{ end }}
          </ul>

          <div class="tab-content">
            {{ range $index, $res := . }}
            <div class="tab-pane{{ if eq $index 0 }} active{{ end }}" id="request-{{ slugify $folder.Name }}-{{ slugify $req.Name }}-responses-{{ $res.ID }}">
              <div class="resp-code"><code><span class="status status-{{ $res.StatusCode }}">Status {{ $res.StatusCode }}</span> {{ $res.Status }}</code></div>
              {{ if hasContent $res.Body }}
                {{ with $example := indentJSON $res.Body }}
                  <pre><code>{{ $example }}</code></pre>
                {{ end }}
              {{ end }}
            </div>
            {{ end }}
          </div>
        </div>
        {{ end }}
        <!-- END example responses -->
      </div>
    </div>
  {{ end }}
  <!-- END iterate through all requests -->

  </div>
<!-- END iterate through all groups -->
