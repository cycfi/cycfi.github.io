# [Cycfi] documentation website repository

The Cycfi website is built using [Jekyll] and the following tools:

- [Bundler] Ruby gems manager, required to run Jekyll and related plugins /
  dependencies.

- [Yarn] package manager, to install [Bootstrap] and related tools to compile and
  minify the website styles and scripts.

## Test with Jekyll locally

In order to test the website without having a webserver running and also see
the changes in real time use the `jekyll.sh` script to run [Jekyll] locally from
the current directory, using the `-a` parameter if it is also necessary
to rebuild the style and script assets.

It requires [Ruby] to be installed; [RVM] is the preferred choice for this.
Other dependecies like [Bundler] and [Yarn] will be installed locally
respectively in the `.bundle` and `node_modules` directories.

The current Gemfile configuration is set to use the same Jekyll and related
gem versions as in [GitHub pages].

The website will be available at <http://localhost:4000/>.

[Bundler]:      https://bundler.io/
[Cycfi]:        https://cycfi.github.io/
[GitHub pages]: https://pages.github.com/versions/
[Jekyll]:       https://jekyllrb.com/
[Ruby]:         https://www.ruby-lang.org/en/
[RVM]:          http://rvm.io/
[Yarn]:         https://yarnpkg.com/
