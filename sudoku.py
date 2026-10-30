def print_grid(grid):
    for row in grid:
        print(" ".join(map(str, row)))


def is_safe(grid, row, col, num):
    # Check row
    for j in range(9):
        if grid[row][j] == num:
            return False

    # Check column
    for i in range(9):
        if grid[i][col] == num:
            return False

    # Check 3x3 subgrid
    start_row = (row // 3) * 3
    start_col = (col // 3) * 3

    for i in range(start_row, start_row + 3):
        for j in range(start_col, start_col + 3):
            if grid[i][j] == num:
                return False

    return True


def solve_sudoku(grid):
    # Find an empty cell
    for row in range(9):
        for col in range(9):
            if grid[row][col] == 0:

                # Try numbers from 1 to 9
                for num in range(1, 10):
                    if is_safe(grid, row, col, num):
                        grid[row][col] = num

                        if solve_sudoku(grid):
                            return True

                        # Backtrack
                        grid[row][col] = 0

                return False

    return True


def valid_initial_grid(grid):
    for i in range(9):
        for j in range(9):
            num = grid[i][j]

            if num != 0:
                grid[i][j] = 0
                valid = is_safe(grid, i, j, num)
                grid[i][j] = num

                if not valid:
                    return False

    return True


# Take input from user
print("Enter Sudoku row by row.")
print("Enter 9 digits separated by spaces; use 0 for empty cells.")

grid = []

for i in range(9):
    row = list(map(int, input(f"Row {i + 1}: ").split()))

    if len(row) != 9 or any(n < 0 or n > 9 for n in row):
        print("Invalid input! Enter exactly 9 numbers from 0 to 9.")
        raise SystemExit

    grid.append(row)


if not valid_initial_grid(grid):
    print("Invalid Sudoku: duplicate numbers found.")
elif solve_sudoku(grid):
    print("\nSolved Sudoku:")
    print_grid(grid)
else:
    print("No solution exists.")