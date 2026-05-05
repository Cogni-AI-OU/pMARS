# AGENTS.md

## Compilation Instructions

To compile pMARS, follow these steps:

1.  **Navigate to the source directory:**
    ```bash
    cd src
    ```

2.  **Run the build command:**
    Choose the build target that suits your needs:
    -   **Standard Build (with cdb debugger):**
        ```bash
        make default
        ```
    -   **Server Build (no debugger):**
        ```bash
        make server
        ```
    -   **Curses Display Build:**
        ```bash
        make curses
        ```
    -   **SDL Graphics Build:**
        ```bash
        make sdl
        ```
    -   **X Windows Graphics Build:**
        ```bash
        make xwin
        ```
    -   **Small Memory Build:**
        ```bash
        make smallmem
        ```

3.  **Clean up build artifacts (optional):**
    ```bash
    make clean
    ```

## Verification

After compilation, you should find the `pmars` executable in the `src` directory. You can verify it by running:
```bash
./pmars
```
