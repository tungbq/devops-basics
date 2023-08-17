console_log() {
  echo "\e[32m>>> [Git] $1\e[0m"
}

WORKSPACE="/tmp/devops-basic/git/demo"

console_log "Cleanup previous run data"
rm -rf $WORKSPACE

console_log "Prepare new data"
mkdir -p $WORKSPACE

console_log "Clone repository"
cd $WORKSPACE
git clone git@github.com:tungbq/devops-basic.git

console_log "Navigate to the cloned repo"
cd devops-basic
ls -la

console_log "Switch to main branch"
git checkout main

console_log "Create new development branch, from main branch"
git checkout -b my-dev-branch

console_log "Make change - Update file"
echo "Testing README.md" >>README.md

echo "Make change - New file"
console_log "Hello-world" >hello-world.txt

console_log "Check git status"
git status

#### We should see result like this:
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git restore <file>..." to discard changes in working directory)
#         modified:   README.md

# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#         hello-world.txt

console_log "Add all the changes"
git add .

console_log "Commit the changes"
git commit -m "dev: this is my first commit"

console_log "Push the change (dry-run)"
git push origin my-dev-branch --dry-run
console_log "Just for demo! In real world, we will not use the --dry-run option"

console_log "Check git log (last 3 commits)"
git --no-pager log -n 3

console_log "Check git status - again"
git status