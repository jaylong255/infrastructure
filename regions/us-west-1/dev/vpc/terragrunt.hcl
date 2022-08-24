terraform {
  // pointing locally for faster iteration during the initial build
  source = "../../../../../../GitHub/terraform-modules/vpc"

  // pointing to the repository
  # source = "git@bitbucket.org:ProjectName/repository-name.git//module-name"

  // for reference for when we start tagging versions
  // source = "git@bitbucket.org:ProjectName/repository-name.git//module-name?ref=1.0.1"
}

# dependencies {
#   paths = ["../some-path"]
# }

include {
  path = "${find_in_parent_folders()}"
}
