import React
from matrix_provider import MatrixContext


@do
def MatrixContent(name):
    ctx = React.useContext(MatrixContext)
    M = getattr(ctx, name)
    input_style = {
        'max-width': '40px',
        'font-size': '12pt',
        'text-align': 'center',
        'padding': 0
    }
    def change_item(m, n):
        def _(e):
            ctx.change_item(
                name, m, n,
                float(e.target.value)
            )
        return _
    rows = []
    for _m in range(len(M)):
        row = []
        for _n in range(len(M[0])):
            row.append(
                <td><input
                  style={input_style}
                  value={M[_m][_n]}
                  onChange={change_item(_m, _n) if name != 'res' else ''}
                />
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
        'transform': 'scale(2, ' + str(len(M) * 2) + ')'
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
