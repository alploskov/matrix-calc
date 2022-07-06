import React


@do
def MatrixContent(m, n, content):
    input_style = {
        'max-width': '40px',
        'font-size': '12pt',
        'text-align': 'center',
        'padding': 0
    }
    rows = []
    for _m in range(m):
        row = []
        for _n in range(n):
            row.append(
                <td><input
                  style={input_style}
                  value={content[_m][_n]} />
                </td>
            )
        rows.append(<tr>{row}</tr>)
    content_style = {
        'display': 'flex',
        'justify-content': 'center',
        'align-items': 'center',
        'margin': '0 auto 10% auto',
        'width': '90%'
    }
    border_style = {
        'transform': 'scale(2, ' + str(m * 2) + ')'
    }
    return (
        <div style={content_style}>
          <mo style={border_style}>(</mo>
	  <table>
            {rows}
	  </table>
	  <mo style={border_style}>)</mo>
        </div>
    )
