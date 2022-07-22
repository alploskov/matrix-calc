import React
from React import use_state


MatrixContext = React.createContext()

def MatrixProvider(props):
    B, set_B = use_state([[0, 0], [0, 0]])
    A, set_A = use_state([[0, 0], [0, 0]])
    detA, set_detA = use_state(0)
    detB, set_detB = use_state(0)
    res, set_res = use_state([[0, 0], [0, 0]])
    op, set_op = use_state('+')

    def change_item(name, m, n, val):
        M, set_M = ([A[:], set_A] if name == 'A' else [B[:], set_B])
        M[m][n] = val
        set_M(M)
        do_op()
        set_det(name)

    def add_column(name):
        M, set_M = ([A, set_A] if name == 'A' else [B, set_B])
        def _():
            new_M = M[:]
            for _m in range(len(M)):
                new_M[_m] += [0]
            set_M(new_M)
            do_op()
            set_det(name)
        return _
    
    def remove_column(name):
        M, set_M = ([A, set_A] if name == 'A' else [B, set_B])
        def _():
            if len(M[0]) == 1:
                return 0
            new_M = M[:]
            for _m in range(len(M)):
                new_M[_m] = new_M[_m][:-1]
            set_M(new_M)
            do_op()
            set_det(name)
        return _

    def add_row(name):
        M, set_M = ([A, set_A] if name == 'A' else [B, set_B])
        def _():
            set_M(M + [[0] * len(M[0])])
            do_op()
            set_det(name)
        return _

    def remove_row(name):
        M, set_M = ([A, set_A] if name == 'A' else [B, set_B])
        def _():
            if len(M) == 1:
                return 0
            set_M(M[:-1])
            do_op()
            set_det(name)
        return _
    
    def add():
        result = []
        if len(A) != len(B):
            return 0
        if len(A[0]) != len(B[0]):
            return 0
        m, n = len(A), len(A[0])
        set_op('+')
        for _m in range(m):
            result += [[0] * n]
            for _n in range(n):
                result[_m][_n] = A[_m][_n] + B[_m][_n]
        set_res(result)
        
    def sub():
        if len(A) != len(B):
            return 0
        if len(A[0]) != len(B[0]):
            return 0
        result = []
        set_op('-')
        m, n = len(A), len(A[0])
        for _m in range(m):
            result += [[0] * n]
            for _n in range(n):
                result[_m][_n] = A[_m][_n] - B[_m][_n]
        set_res(result)

    def mul():
        set_res([[0, 0], [0, 0]])

    def invert_matrix(name):
        M, set_M = ([A, set_A] if name == 'A' else [B, set_B])
        do_op()

    def transponse(name):
        M, set_M = ([A, set_A] if name == 'A' else [B, set_B])
        def _():
            res = []
            for i in range(len(M[0])):
                res.append([0] * len(M))
                for j in range(len(M)):
                    res[i][j] = M[j][i]
            set_M(res)
            do_op()
            set_det(name)
        return _

    def do_op():
        if op == '+':
            add()
        elif op == '-':
            sub()
        elif op == '*':
            mul()

    def set_det(name):
        if name == 'A':
            set_detA(det(A))
        elif name == 'B':
            set_detB(det(B))

    def det(M):
        m, n = len(M), len(M[0])
        if m != n:
            return NaN
        if m == 1:
            return M[0][0]
        if m == 2:
            return M[0][0] * M[1][1] - M[0][1] * M[1][0]
        _det = 0
        for j in range(m):
            _det += ((-1) ** j) * M[0][j] * minor(M, 0, j)
        return _det

    def minor(M, i, j):
        _M = []
        for _i in range(len(M)):
            if _i == i:
                continue
            row = []
            for _j in range(len(M[0])):
                if _j == j:
                    continue
                row.append(M[_i][_j])
            _M.append(row)
        return det(_M)

    def rank(name):
        M, set_M = ([A, set_A] if name == 'A' else [B, set_B])
        r, k = 1, min(len(M), len(M[0]))

    return React.createElement(
        MatrixContext.Provider,
        {'value': do(
            change_item,
            add,
            sub,
            mul,
            detA, detB,
            transponse,
            A, set_A,
            B, set_B,
            res, set_res,
            op, set_op,
            add_column, remove_column,
            add_row, remove_row
        )},
        props.children
    )
