gulp = require("gulp")

gulp.task "bump/bower.json", ->
  bump = require("gulp-bump")
  gulp.src ["bower.json"]
    .pipe bump type: "patch"
    .pipe gulp.dest "./"

gulp.task "bump", ["bump/bower.json"], ->
  git = require("gulp-git")
  version = require("../bower.json")["version"]
  gulp.src ["bower.json"]
    .pipe git.add()
    .pipe git.commit "chore: bump version into #{version}"
    .on "end", ->
      git.tag(version, version, ->)

