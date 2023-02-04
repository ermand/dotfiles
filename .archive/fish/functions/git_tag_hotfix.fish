function git_tag_hotfix
    git tag -a v$number -m "Hotfix v$number" && git push origin v$number
end
