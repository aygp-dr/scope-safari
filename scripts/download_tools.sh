#!/bin/bash
# Script to download TLA+ tools and language reference manuals

set -e  # Exit on error

TOOLS_DIR="tools"
DOCS_DIR="docs/references"
DOWNLOAD_DIR="/tmp/scope-safari-downloads"

# Create directories if they don't exist
mkdir -p "$TOOLS_DIR" "$DOCS_DIR" "$DOWNLOAD_DIR"

echo "===== Downloading Tools and References ====="

# Download TLA+ tools
download_tla_tools() {
    echo "Downloading TLA+ tools..."
    
    # TLA+ Toolbox
    TLA_VERSION="1.7.1"
    TLA_URL="https://github.com/tlaplus/tlaplus/releases/download/v${TLA_VERSION}/TLAToolbox-${TLA_VERSION}.tar.gz"
    
    if [ ! -d "$TOOLS_DIR/tla-toolbox" ]; then
        echo "Downloading TLA+ Toolbox ${TLA_VERSION}..."
        curl -L "$TLA_URL" -o "$DOWNLOAD_DIR/tla-toolbox.tar.gz"
        mkdir -p "$TOOLS_DIR/tla-toolbox"
        tar -xzf "$DOWNLOAD_DIR/tla-toolbox.tar.gz" -C "$TOOLS_DIR/tla-toolbox" --strip-components=1
        echo "TLA+ Toolbox downloaded to $TOOLS_DIR/tla-toolbox"
    else
        echo "TLA+ Toolbox already exists at $TOOLS_DIR/tla-toolbox"
    fi
    
    # TLA+ Tools JAR (for command line use)
    TLA_JAR_URL="https://github.com/tlaplus/tlaplus/releases/download/v${TLA_VERSION}/tla2tools.jar"
    
    if [ ! -f "$TOOLS_DIR/tla2tools.jar" ]; then
        echo "Downloading TLA+ command line tools..."
        curl -L "$TLA_JAR_URL" -o "$TOOLS_DIR/tla2tools.jar"
        echo "TLA+ command line tools downloaded to $TOOLS_DIR/tla2tools.jar"
    else
        echo "TLA+ command line tools already exist at $TOOLS_DIR/tla2tools.jar"
    fi
}

# Download language reference manuals
download_reference_manuals() {
    echo "Downloading language reference manuals..."
    
    # Define manuals to download (URL, local filename)
    declare -A MANUALS=(
        ["https://www.gnu.org/software/guile/manual/guile.pdf"]="guile-manual.pdf"
        ["https://www.gnu.org/software/emacs/manual/pdf/elisp.pdf"]="elisp-manual.pdf"
        ["https://docs.racket-lang.org/guide/guide.pdf"]="racket-guide.pdf"
        ["https://doc.rust-lang.org/book/print.html"]="rust-book.pdf"
        ["https://ziglang.org/documentation/master/std-lib.html"]="zig-std-lib.pdf"
        ["https://golang.org/doc/go_spec.pdf"]="go-spec.pdf"
        ["https://clojure.org/api/cheatsheet"]="clojure-cheatsheet.pdf"
        ["https://lamport.azurewebsites.net/tla/book-02-08-08.pdf"]="tla-book.pdf"
        ["https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-4.html"]="sicp.pdf"
        ["https://learnxinyminutes.com/docs/c/"]="learn-c.pdf"
        ["https://learnxinyminutes.com/docs/python/"]="learn-python.pdf"
        ["https://learnxinyminutes.com/docs/javascript/"]="learn-javascript.pdf"
        ["https://learnxinyminutes.com/docs/smalltalk/"]="learn-smalltalk.pdf"
    )
    
    # Download each manual
    for URL in "${!MANUALS[@]}"; do
        FILENAME="${MANUALS[$URL]}"
        
        if [ ! -f "$DOCS_DIR/$FILENAME" ]; then
            echo "Downloading $FILENAME..."
            # For HTML resources that need to be converted to PDF
            if [[ "$URL" == *".html"* ]]; then
                if command -v wkhtmltopdf >/dev/null 2>&1; then
                    curl -L "$URL" -o "$DOWNLOAD_DIR/temp.html"
                    wkhtmltopdf "$DOWNLOAD_DIR/temp.html" "$DOCS_DIR/$FILENAME"
                    rm "$DOWNLOAD_DIR/temp.html"
                else
                    echo "Warning: wkhtmltopdf not installed, skipping conversion of $URL to PDF"
                    # Just download the HTML as a fallback
                    curl -L "$URL" -o "$DOCS_DIR/${FILENAME%.pdf}.html"
                fi
            else
                curl -L "$URL" -o "$DOCS_DIR/$FILENAME"
            fi
            echo "Downloaded $FILENAME"
        else
            echo "$FILENAME already exists"
        fi
    done
}

# Download the TLA+ Tools book specifically
download_tla_book() {
    echo "Downloading TLA+ book..."
    
    TLA_BOOK_URL="https://lamport.azurewebsites.net/tla/book-02-08-08.pdf"
    
    if [ ! -f "$DOCS_DIR/tla-book.pdf" ]; then
        echo "Downloading TLA+ book..."
        curl -L "$TLA_BOOK_URL" -o "$DOCS_DIR/tla-book.pdf"
        echo "TLA+ book downloaded to $DOCS_DIR/tla-book.pdf"
    else
        echo "TLA+ book already exists at $DOCS_DIR/tla-book.pdf"
    fi
}

# Main execution
download_tla_tools
download_reference_manuals
download_tla_book

echo "===== Cleaning up ====="
rm -rf "$DOWNLOAD_DIR"

echo "===== All downloads completed ====="
echo "TLA+ tools installed in: $TOOLS_DIR"
echo "Reference manuals downloaded to: $DOCS_DIR"