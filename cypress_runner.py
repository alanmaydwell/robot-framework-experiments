import subprocess

def run_cypress_script(filepath, cypress_path):
    command_elements = [cypress_path, 'run', '--spec', filepath]
    print("Going to execute the following:")
    print(" ".join(command_elements))
    response = subprocess.run(
         command_elements,
         stdout=subprocess.PIPE,
         stderr=subprocess.STDOUT,
         # shell=True needed to avoid "WinError 2: File not found" (Windows only?)
         shell=True
    )
    return response.stdout.decode()


if __name__ == "__main__":
    cypress_script = r"cypress\e2e\quick_spec.cy.js"
    cypress_executable = r"node_modules\.bin\cypress"
    
    # Just checking we've the right file!
    print("Script to execute:")
    with open(cypress_script, "r") as infile:
        print(infile.read())
    # Also check we've also got the cypress executable    
    with open(cypress_executable, "r") as infile:
        print(infile)
        
    response = run_cypress_script(cypress_script, cypress_executable)
    print(response)