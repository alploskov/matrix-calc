import React
from matrix import Matrix
from matrix_content import MatrixContent
style('./app.css')

def App():
    action, set_action = use_state('+')
    result, set_result = use_state([[0, 0], [0, 0]])
    return (
        <div id="app">
          <div id="inp">
            <Matrix name="A" />
            <div id="general-actions">
              <button>+</button>
              <button>-</button>
              <button>*</button>
            </div>
            <Matrix name="B" />
          </div>
          <hr />
          <div id="result">
            <h2>
              Matrix A{action}B
            </h2>
            <MatrixContent
              m={len(result)}
              n={len(result[0])}
              content={result}
            />
          </div>
        </div>
    )
