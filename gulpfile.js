var gulp = require('gulp'),
    uglify = require('gulp-uglify'),
    react = require('gulp-react'),

gulp.task('default', function() {
    gulp.src('./static/js/?(app|index).js')
        .pipe(gulp.dest('./build/js'))
    gulp.src('./static/js/!(app|index).js')
        .pipe(react())
        .pipe(uglify())
        .pipe(hasher())
        .pipe(gulp.dest('./build/js'))
    gulp.src('./static/lib/**/*.min.js')
        .pipe(gulp.dest('./build/lib'))
});
