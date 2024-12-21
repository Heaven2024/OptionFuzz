import subprocess
import os
from pathlib import Path

def get_all_smt_files_recursively(directory):
    return list(Path(directory).rglob('*.smt2'))

def run_solver(solver_bin, smt_file):
    command = f"timeout 10s {solver_bin} {smt_file}"
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    return result.stdout.strip()

def run_z3_coverage(z3_folder, z3_bin, seeds_folder):
    print("Clearing previous Z3 coverage data...")
    try:
        subprocess.run("lcov -d ./ -z", shell=True, cwd=z3_folder, check=True)
        print("Coverage data cleared successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error resetting coverage: {e}")
        return

    print("Running Z3 on seed files...")
    files = get_all_smt_files_recursively(seeds_folder)
    for file in files:
        print(f"Processing {file}")
        result = run_solver(z3_bin, str(file))
        print(f"Result: {result[:50]}...")  # Print first 50 chars of result

    print("Generating Z3 coverage data...")
    try:
        subprocess.run("fastcov -l -o coverage-seed100.info", shell=True, cwd=z3_folder, check=True)
        print("Coverage data generated successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error generating coverage: {e}")
        return

    # Print coverage summary
    print("\nZ3 Coverage Summary:")
    coverage_file = os.path.join(z3_folder, "coverage-seed100.info")
    if os.path.exists(coverage_file):
        try:
            subprocess.run(f"lcov --summary {coverage_file}", shell=True, check=True)
        except subprocess.CalledProcessError as e:
            print(f"Error generating coverage summary: {e}")
    else:
        print(f"Warning: Coverage file {coverage_file} not found.")

if __name__ == "__main__":
    z3_folder = "/optionfuzz/z3-master"  # Replace with actual Z3 folder path
    z3_bin = "/optionfuzz/z3-master/build/z3"  # Replace with actual Z3 binary path
    seeds_folder = "/opensmt_/test3"  # Replace with actual seeds folder path

    try:
        run_z3_coverage(z3_folder, z3_bin, seeds_folder)
        print("Z3 CODE COVERAGE ANALYSIS COMPLETED SUCCESSFULLY")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")