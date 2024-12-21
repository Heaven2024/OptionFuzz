import networkx as nx
from collections import deque

def generate_option_combinations(graph, max_combination_size=5):
    """
    Generate valid option combinations using BFS, excluding conflicting options.

    Args:
        graph (nx.DiGraph): The relationship graph where nodes are options and edges represent relationships.
        max_combination_size (int): Maximum number of combinations to return.

    Returns:
        list: A list of valid option combinations (each combination is a list of options).
    """
    valid_combinations = []  # To store result combinations
    nodes = list(graph.nodes)  # All options (nodes)

    # BFS to traverse the graph and form valid combinations
    for start_node in nodes:  # Iterate all starting nodes
        queue = deque([[start_node]])  # Initialize queue with each node as the start of a combination

        while queue:
            # Dequeue the current combination
            current_combination = queue.popleft()
            
            # Check if this combination is valid
            if len(valid_combinations) >= max_combination_size:
                return valid_combinations

            # Expand the combination by adding new nodes
            for node in nodes:
                if node not in current_combination:
                    # Validate the addition of `node`
                    is_valid = True
                    for existing_node in current_combination:
                        # Check for conflicts between current combination nodes and the candidate node
                        if graph.has_edge(existing_node, node):
                            relationship = graph.edges[existing_node, node].get("label")
                            if relationship == "Conflict":
                                is_valid = False
                                break
                    
                    # If valid, create a new combination
                    if is_valid:
                        new_combination = current_combination + [node]
                        queue.append(new_combination)
                        valid_combinations.append(new_combination)

    return valid_combinations


# Debugging & Standalone Test Code
if __name__ == "__main__":
    # Create an example graph for testing
    G = nx.DiGraph()
    G.add_edge("option_a", "option_b", label="Conflict")
    G.add_edge("option_b", "option_c", label="Dependency")
    G.add_edge("option_a", "option_c", label="Conflict")
    G.add_edge("option_d", "option_a", label="Dependency")

    # Generate combinations
    print("Relationship Graph Nodes:", G.nodes())
    print("Relationship Graph Edges:")
    for edge in G.edges(data=True):
        print(edge)

    # Generate and print combinations
    combinations = generate_option_combinations(G, max_combination_size=5)
    print("\nGenerated Option Combinations:")
    for comb in combinations:
        print(comb)