from matrix_content import MatrixContent
import React
from matrix_provider import MatrixContext
style('./matrix.css')


@do
def Matrix(name):
    ctx = React.useContext(MatrixContext)    
    rang = 0
    det = 0
    return (
        <div className="matrix">
	  <h2>Matrix {name}</h2>
	  <MatrixContent name={name} />
	  <div className="matrix-size">
	    <div className="size">
              <button onClick={ctx.remove_row(name)}>-</button>
              <span>{len(ctx[name])}</span>
              <button onClick={ctx.add_row(name)}>+</button>
            </div><div className="size_sep">x</div> <div className="size">
              <button onClick={ctx.remove_column(name)}>-</button>
              <span>{len(ctx[name][0])}</span>
              <button onClick={ctx.add_column(name)}>+</button>
            </div>
	  </div>
	  <div className="matrix-actions">
	      <button>{name}<sup>-1</sup></button>
      	      <button onClick={ctx.transponse(name)}>{name}<sup>T</sup></button>
	  </div>
	  <div className="matrix-info">
	    <p>det {name} = {det}</p>
	    <p>rang {name} = {rang}</p>
	  </div>
        </div>
    )
