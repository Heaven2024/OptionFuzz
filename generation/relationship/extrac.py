import openai
import markdown
from bs4 import BeautifulSoup
import itertools
import networkx as nx
import matplotlib.pyplot as plt

# GPT API Setup
openai.api_key = "your_openai_api_key"  # Replace with your OpenAI API key

# Helper function to read `.md` file and parse the options
def parse_md_file(file_path):
    """
    Parse the markdown file and extract the options and their metadata.

    Args:
        file_path (str): Path to the Markdown file.

    Returns:
        list: A list of options, each being a dictionary with parameters.
    """
    # Read and parse markdown
    with open(file_path, "r", encoding="utf-8") as file:
        md_content = file.read()

    # Convert markdown to HTML and parse with BeautifulSoup
    html_content = markdown.markdown(md_content)
    soup = BeautifulSoup(html_content, "html.parser")

    # Extract table rows
    options = []
    for table in soup.find_all("table"):
        rows = table.find_all("tr")
        header = [col.text.strip() for col in rows[0].find_all("th") or rows[0].find_all("td")]
        for row in rows[1:]:
            option = {header[i]: col.text.strip() for i, col in enumerate(row.find_all("td"))}
            options.append(option)
    return options

# Function to call GPT-4 API
def analyze_relationships(options):
    """
    Use GPT-4 to analyze relationships between options.

    Args:
        options (list): List of dictionaries, each representing an option.

    Returns:
        dict: Pairwise relationships between options.
    """
    # Generate prompt
    option_text = "\n".join([f"{opt['Parameter']}: {opt['Description']}" for opt in options])
    prompt = f"""
    You are an expert in SMT (Satisfiability Modulo Theories) solvers. Your task is to analyze the relationships
    between different solver options. Given a set of options, determine their pairwise relationships based
    on their descriptions. The possible relationships are:

    Conflict: The options cannot be used together.
    Dependency: The options must be used together.
    Similar: The options can be substituted for each other.
    Irrelevancy: The options do not affect each other and can be used independently.

    For each pair of options, provide your analysis in the following format:
    Option A - Option B: [Conflict/Dependency/Similar/Irrelevancy]  
    Confidence: [High/Low]  

    Important note: Identify all four relationship types, but in your final output, classify "Similar" and
    "Irrelevancy" relationships as "Conflict". Only use "Conflict" or "Dependency" in your final classification.

    Here are the options to analyze:
    {option_text}

    Please analyze the relationships between all possible pairs of these options.
    """

    # Call GPT-4 API
    print("Querying GPT-4, please wait...")
    response = openai.ChatCompletion.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": prompt},
        ]
    )

    # Parse GPT-4 response
    response_text = response["choices"][0]["message"]["content"]
    relationships = {}
    for line in response_text.splitlines():
        if "-" in line and "Confidence:" in line:
            parts = line.split(":")
            pair = parts[0].strip()
            relationship_type = parts[1].strip()
            relationships[pair] = relationship_type
    return relationships

# Function to plot the relationship graph
def plot_relationship_graph(relationships):
    """
    Plot the graph of relationships between SMT options.

    Args:
        relationships (dict): Pairwise relationships between SMT options.
    """
    graph = nx.DiGraph()

    # Add edges to graph
    for pair, relation in relationships.items():
        option_a, option_b = [opt.strip() for opt in pair.split("-")]
        graph.add_edge(option_a, option_b, label=relation)

    # Draw graph
    pos = nx.spring_layout(graph)  # Layout for visualization
    plt.figure(figsize=(12, 8))
    nx.draw(
        graph, pos,
        with_labels=True,
        node_size=3000,
        node_color="lightblue",
        font_size=10,
        font_weight="bold",
        connectionstyle="arc3,rad=0.2"
    )
    edge_labels = nx.get_edge_attributes(graph, 'label')
    nx.draw_networkx_edge_labels(graph, pos, edge_labels=edge_labels, font_size=10)
    
    # Show plot
    plt.title("SMT Options Relationship Graph", fontsize=16)
    plt.show()

def process_relationships(relationships):
    """
    Process relationships based on confidence levels.

    Args:
        relationships (dict): Raw relationships with confidence levels.

    Returns:
        dict: Filtered relationships with high confidence and few-shot learning for low confidence.
    """
    high_confidence = {}
    low_confidence = {}

    for pair, relation in relationships.items():
        if "High" in relation:
            high_confidence[pair] = relation
        else:
            low_confidence[pair] = relation

    # For low confidence relationships, use few-shot learning
    for pair in low_confidence:
        # Provide few-shot examples to LLM
        few_shot_prompt = f"""
        Here are some examples of relationships between options:
        Option A - Option B: Conflict
        Option C - Option D: Dependency
        Option E - Option F: Similar

        Now, please analyze the relationship for the following pair:
        {pair}
        """
        # Call LLM again with few-shot examples
        # (You would implement the call to LLM here similar to the previous function)
        # Example: new_relation = call_llm_with_few_shot(few_shot_prompt)
        # Update the relationship dictionary with the new relation

    return high_confidence, low_confidence

# Main function to integrate all steps
def main():
    # Step 1: Parse the markdown file for options
    file_path = "smt_options.md"  # Replace with your .md file path
    options = parse_md_file(file_path)

    # Step 2: Analyze the relationships using GPT
    relationships = analyze_relationships(options)

    # Step 3: Plot the relationships graph
    plot_relationship_graph(relationships)

# Run the main function
if __name__ == "__main__":
    main()