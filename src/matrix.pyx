from matrix_content import MatrixContent
import React
style('./matrix.css')


def Matrix():
    content, set_content = use_state([[0, 0], [0, 0]])
    m, set_m = use_state(2)
    n, set_n = use_state(2)

    def add_column():
        set_n(n + 1)
        new_cont = content
        for _m in range(m):
            new_cont[_m] += [0]
        set_content(new_cont)

    def remove_column():
        if n == 1:
            return 0
        new_cont = content
        set_n(n - 1)
        for row in new_cont:
            row = row[:-1]
        set_content(new_cont)

    def add_row():
        set_m(m + 1)
        set_content(content + [[0] * n])

    def remove_row():
        if m == 1:
            return 0
        set_m(m - 1)
        set_content(content[:-1])

    rang = 0
    det = 0
    return (
        <div className="matrix">
	  <h2>Matrix А</h2>
	  <MatrixContent m={m} n={n} content={content} />
	  <div className="matrix-size">
	    <div className="size">
              <button onClick={remove_row}>-</button>
              <span>{m}</span>
              <button onClick={add_row}>+</button>
            </div> x <div className="size">
              <button onClick={remove_column}>-</button>
              <span>{n}</span>
              <button onClick={add_column}>+</button>
            </div>
	  </div>
	  <div className="matrix-actions">
	      <button>A<sup>-1</sup></button>
      	      <button>A<sup>T</sup></button>
	  </div>
	  <div className="matrix-info">
	    <p>det A = {det}</p>
	    <p>rang A = {rang}</p>
	  </div>
        </div>
    )
