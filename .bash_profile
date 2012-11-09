# Load extra files from ~./extra: .local, .exports, .aliases, .functions
# ~/.extra/.local can be used for settings you don’t want to commit
for file in ~/.extra/.{exports,aliases,functions,bash_prompt,local}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Prefer US English and use UTF-8 (support in Lion)
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US"