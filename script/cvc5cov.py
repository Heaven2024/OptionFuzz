import subprocess
import os
from pathlib import Path

def get_all_smt_files_recursively(directory):
    return list(Path(directory).rglob('*.smt2'))

def run_solver(solver_bin, smt_file):
    command = f"timeout 10s {solver_bin} {smt_file}"
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    return result.stdout.strip()

def run_cvc5_coverage(cvc5_folder, cvc5_bin, seeds_folder):
    cvc5_build_folder = os.path.join(cvc5_folder, "build")
    
    print("Clearing previous CVC5 coverage data...")
    try:
        subprocess.run("make coverage-reset", shell=True, cwd=cvc5_build_folder, check=True)
        print("Coverage data cleared successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error resetting coverage: {e}")
        return

    print("Running CVC5 on seed files...")
    files = get_all_smt_files_recursively(seeds_folder)
    for file in files:
        print(f"Processing {file}")
        result = run_solver(cvc5_bin, str(file))
        print(f"Result: {result[:50]}...")  # Print first 50 chars of result

    print("Generating CVC5 coverage data...")
    try:
        subprocess.run("make coverage", shell=True, cwd=cvc5_build_folder, check=True)
        print("Coverage data generated successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error generating coverage: {e}")
        return

    print("Moving coverage file...")
    try:
        subprocess.run("mv coverage.info coverage-seed100.info", shell=True, cwd=cvc5_build_folder, check=True)
        print("Coverage file moved successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error moving coverage file: {e}")
        return

    # Print coverage summary
    print("\nCVC5 Coverage Summary:")
    coverage_file = os.path.join(cvc5_build_folder, "coverage-seed100.info")
    if os.path.exists(coverage_file):
        try:
            subprocess.run(f"lcov --summary {coverage_file}", shell=True, check=True)
        except subprocess.CalledProcessError as e:
            print(f"Error generating coverage summary: {e}")
    else:
        print(f"Warning: Coverage file {coverage_file} not found.")

if __name__ == "__main__":
    cvc5_folder = "/optionfuzz/cvc5"  # Replace with actual CVC5 folder path
    cvc5_bin = "/optionfuzz/cvc5/build/bin/cvc5"  # Replace with actual CVC5 binary path
    seeds_folder = "/opensmt_/cvc5"  # Replace with actual seeds folder path

    try:
        run_cvc5_coverage(cvc5_folder, cvc5_bin, seeds_folder)
        print("CVC5 CODE COVERAGE ANALYSIS COMPLETED SUCCESSFULLY")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")