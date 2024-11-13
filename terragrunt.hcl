terraform {
    source = "./modules/python-app"

before_hook "docker_build_and_push" {
  commands = ["apply", "plan", "init"]
  execute  = ["bash", "-c", "./script.sh"]
}
}