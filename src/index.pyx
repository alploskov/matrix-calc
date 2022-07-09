import ReactDOM
import React
from app import App
from matrix_provider import MatrixProvider


react_render(
    <MatrixProvider>
      <App />
    </MatrixProvider>,
    document['root']
)
