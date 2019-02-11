workflow "lint & test" {
  on = "push"
  resolves = ["lint", "test", "publish"]
}

action "install" {
  uses = "actions/npm@master"
  args = "ci"
}

action "lint" {
  needs = "install"
  uses = "actions/npm@master"
  args = "run lint"
}

action "test" {
  needs = "install"
  uses = "actions/npm@master"
  args = "test"
}

action "publish" {
  needs = "test"
  uses = "primer/publish@v1.0.0"
  secrets = [
    "GITHUB_TOKEN",
  ]
}
