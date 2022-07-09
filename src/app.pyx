import React
from matrix import Matrix
from matrix_content import MatrixContent
from matrix_provider import MatrixContext
style('./app.css')


def App():
    action, set_action = use_state('+')
    ctx = React.useContext(MatrixContext)
    return (
          <div id="app">
            <div id="inp">
              <Matrix name="A" />
              <div id="general-actions">
                <button onClick={ctx.add}>+</button>
                <button onClick={ctx.sub}>-</button>
                <button>*</button>
              </div>
              <Matrix name="B" />
            </div>
            <hr />
            <div id="result">
              <h2>
                Matrix A{action}B
              </h2>
              <MatrixContent name="res" />
            </div>
          </div>
    )
