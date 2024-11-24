# Screenshot Cleanup Tool

This is a simple and efficient bash script designed to clean up old screenshots from your `Pictures/Screenshots` directory. The script removes all image files (e.g., `.png`, `.jpg`, `.jpeg`) that are older than today's date. This tool is ideal for maintaining a tidy system by automatically managing screenshots and freeing up disk space.

---

## Features

- Deletes all images in the `Pictures/Screenshots` folder that are older than today.
- Works for `.png`, `.jpg`, and `.jpeg` files.
- Simple and efficient to use.
- Verbose output to display deleted files.

---

## How to Use

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/Rehjii-Martin/Declutterer.git
   cd Declutterer
   ```

2. **Make the Script Executable:**

   ```bash
   chmod +x cleanup_screenshots.sh
   ```

3. **Run the Script**
   ```bash
   ./cleanup_screenshots.sh
   ```

## Requirements

    Bash shell
    Linux-based system (e.g., Ubuntu, Fedora) or macOS

# How It Works

**Date Filtering:** The script fetches the current date in YYYY-MM-DD format using date +%Y-%m-%d.

**File Deletion:** The find command searches the Pictures/Screenshots directory for image files and removes any files not modified on or after today's date.

**Logging:** The -v flag ensures all deleted files are listed in the terminal for verification.

## Future Enhancements

**Add support for additional file formats.**

**Integrate scheduling via cron jobs for automatic cleanup.**

**Option to archive old screenshots instead of deleting them.**
