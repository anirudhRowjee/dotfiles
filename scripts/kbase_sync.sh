#!/usr/bin/env sh

# path to knowledgebase
KBASE_PATH="/home/anirudh/gdrive/kbase/alexandria/"

# enter the repo
cd "$KBASE_PATH"

# Sync on Gdrive
# drive pull -hidden -quiet  # don't pull conflicting changes
# drive push -hidden -quiet

rclone copy ~/gdrive/kbase/ gdrive: -vv -I --exclude .git/
notify-send "[KBASE] Google Drive Sync Complete!"

# check if there are changes, no need to push if there are no changes
CHANGES_EXIST="$(git status --porcelain | wc -l)"
if [ "$CHANGES_EXIST" -eq 0 ]; then
    notify-send "[KBASE] Git Sync - Skipping"
    exit 0
fi

git pull
git add .
git commit -q -m "Last Sync: $(date)"
git push -q

notify-send "[KBASE] Git Sync Complete!"


