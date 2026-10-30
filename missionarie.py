from collections import deque

def is_safe(m, c):
    # Check number of people on both banks
    if m < 0 or c < 0 or m > 3 or c > 3:
        return False

    # Left bank safety
    if m > 0 and c > m:
        return False

    # Right bank safety
    rm = 3 - m
    rc = 3 - c

    if rm > 0 and rc > rm:
        return False

    return True


def missionaries_cannibals():
    # State: (Missionaries, Cannibals, Boat)
    # Boat: 0 = Left, 1 = Right

    start = (3, 3, 0)
    goal = (0, 0, 1)

    # Possible boat combinations
    moves = [
        (1, 0),  # 1 Missionary
        (2, 0),  # 2 Missionaries
        (0, 1),  # 1 Cannibal
        (0, 2),  # 2 Cannibals
        (1, 1)   # 1 Missionary + 1 Cannibal
    ]

    queue = deque([(start, [start])])
    visited = {start}

    while queue:
        state, path = queue.popleft()
        m, c, boat = state

        # Check goal
        if state == goal:
            print("\nSolution Found!")

            for step, (ml, cl, side) in enumerate(path):
                print(
                    f"Step {step}: "
                    f"Left Bank: M={ml}, C={cl} | "
                    f"Right Bank: M={3-ml}, C={3-cl} | "
                    f"Boat: {'Left' if side == 0 else 'Right'}"
                )
            return

        for mm, cc in moves:
            if boat == 0:
                # Boat moves Left to Right
                new_state = (m - mm, c - cc, 1)
            else:
                # Boat moves Right to Left
                new_state = (m + mm, c + cc, 0)

            if is_safe(new_state[0], new_state[1]):
                if new_state not in visited:
                    visited.add(new_state)
                    queue.append((new_state, path + [new_state]))

    print("No solution found.")


missionaries_cannibals()