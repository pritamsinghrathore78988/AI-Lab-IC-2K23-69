from collections import deque

def water_jug(cap_a, cap_b, target):
    start = (0, 0)
    queue = deque([(start, [start])])
    visited = {start}

    while queue:
        (a, b), path = queue.popleft()

        if a == target or b == target:
            print("\nSolution found!")
            for step, (x, y) in enumerate(path):
                print(f"Step {step}: Jug A = {x}, Jug B = {y}")
            return

        # Fill, empty, and pour operations
        transfer_ab = min(a, cap_b - b)
        transfer_ba = min(b, cap_a - a)

        next_states = [
            (cap_a, b),  # Fill A
            (a, cap_b),  # Fill B
            (0, b),      # Empty A
            (a, 0),      # Empty B
            (a - transfer_ab, b + transfer_ab),
            (a + transfer_ba, b - transfer_ba)
        ]

        for state in next_states:
            if state not in visited:
                visited.add(state)
                queue.append((state, path + [state]))

    print("Target cannot be measured.")


cap_a = int(input("Enter capacity of Jug A: "))
cap_b = int(input("Enter capacity of Jug B: "))
target = int(input("Enter target amount: "))

if cap_a <= 0 or cap_b <= 0 or target < 0:
    print("Invalid input.")
elif target > max(cap_a, cap_b):
    print("Target must fit in at least one jug.")
else:
    water_jug(cap_a, cap_b, target)