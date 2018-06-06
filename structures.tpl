{{ with $structures := .Structures }}
  <h2 id="doc-api-structures">
    API structures
    <a href="#doc-api-structures"><i class="glyphicon glyphicon-link"></i></a>
  </h2>

  {{ range $structures }}
    <h3 id="struct-{{ .Name }}">
      {{ .Name }}
      <a href="#struct-{{ .Name }}"><i class="glyphicon glyphicon-link"></i></a>
    </h3>

    <p>{{ .Description }}</p>

    <table class="table table-bordered">
      {{ range .Fields }}
        <tr>
          <th>{{ .Name }}</th>
          <td>{{ .Type }}</td>
          <td>{{ .Description }}</td>
        </tr>
      {{ end }}
    </table>
  {{ end }}

{{ end }}
