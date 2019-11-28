Y=2019
M=11
D=28
i=22
comment=" Update README.md"

export GIT_COMMITTER_DATE="$Y-$M-$D 10:$i:34"
export GIT_AUTHOR_DATE="$Y-$M-$D 10:$i:34"
# git add commit.md -f
git add .
git commit --date="$Y-$M-$D 10:$i:34" -m "$comment"
git push