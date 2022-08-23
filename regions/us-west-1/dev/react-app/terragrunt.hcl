terraform {
  // pointing locally for faster iteration during the initial build
  source = "../../../../../../GitHub/terraform-modules/react-app"

  // pointing to the repository
  # source = "git@bitbucket.org:ProjectName/repository-name.git//react-app"

  // for reference for when we start tagging versions
  // source = "git@bitbucket.org:ProjectName/repository-name.git//sg?ref=1.0.1"
}

# dependencies {
#   paths = ["../some-path"]
# }

include {
  path = "${find_in_parent_folders()}"
}
