gulp  = require "gulp"
bump  = require "gulp-bump"
git   = require "gulp-git"

gulp.task "bump", ->
  gulp.src ["bower.json"]
    .pipe bump type: "patch"
    .pipe gulp.dest "./"

gulp.task "tag", ["bump"], ->
  version = require("../bower.json")["version"]
  gulp.src ["bower.json"]
    .pipe git.add()
    .pipe git.commit "bump version into #{version}"
    .on "end", ->
      git.tag(version, version, ->)

