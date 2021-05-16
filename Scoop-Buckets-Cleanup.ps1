function Get-BucketRepoLocations() {
    $loc = @()
    if (Test-Path "~/scoop/buckets" -PathType Container) {
        $loc += Get-ChildItem "~/scoop/buckets" | ForEach-Object {
            $_.FullName
        }
    }
    return $loc
}

Get-BucketRepoLocations | ForEach-Object {
    Push-Location $_
    try {
        # should we use `git gc --prune=all` ?
        git gc
    } finally {
        Pop-Location
    }
}
