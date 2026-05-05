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

## Redcode (.red) File Conventions

To preserve the history and context of warrior development:
- **Do not delete code:** When removing logic from `.red` files, comment it out instead of deleting it.
- **Explain changes:** Always include a comment explaining the reason for the modification or why the code was commented out.
- **Comment character:** Use `;` for comments in Redcode files.

These instructions are maintained in this `AGENTS.md` file and must be followed by all agents.
