function git_tag_release --argument number
    git tag -a v$number -m "Release v$number" && git push origin v$number
end
