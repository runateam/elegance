<div class="scrollspy">
  <div class="brand">
    <div class="logo fallback">
      <img src="./logo.png" alt="{{ .Name }}" class="logo img-responsive" />
    </div>
    <h1>{{ .Name }}</h1>
  </div>

  <ul id="main-menu" data-spy="affix" class="nav">
    <li>
      <a href="#doc-general-notes">General notes</a>
    </li>

    {{ with $structures := .Structures }}
      <li>
        <a href="#doc-api-structures">API structures</a>
        <ul>
          {{ range $structures }}
            <li>
              <a href="#struct-{{ .Name }}">{{ .Name }}</a>
            </li>
          {{ end }}
        </ul>
      </li>
    {{ end }}

    <li>
      <a href="#doc-api-detail">API detail</a>
    </li>

    {{ range .Requests }}
      <li>
        <a href="#request-{{ slugify .Name }}"><span class="req-{{ .Method }} text-lg">{{ .Method }}</span> {{ .Name }}</a>
      </li>
    {{ end }}

    {{ range .Folders }}
    {{ $folder := . }}
      <li>
        <a href="#folder-{{ slugify $folder.Name }}">{{ $folder.Name }}</a>
        <ul>
          {{ range $folder.Requests }}
            <li>
              <a href="#request-{{ slugify $folder.Name }}-{{ slugify .Name }}"><span class="req-{{ .Method }} text-lg">{{ .Method }}</span> {{ .Name }}</a>
            </li>
          {{ end }}
        </ul>
      </li>
    {{ end }}
  </ul>
</div>
