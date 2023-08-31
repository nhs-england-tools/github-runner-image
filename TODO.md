# TODO

- Finish off publishing the Docker image using an automated process
- Create `docker-push` make target
- Lint the Dockerfile
- Spec test the Docker image
- Produce SBOM and scan for CVEs the Docker image
- Plug this repo into
  - SonarCloud
    - Sonar badge should come from main branch
  - NHSE Update from Template
- This CI/CD pipeline has some changes to the RT skeleton, consider porting them back; e.g. a notification should be sent when an artefact is published, not built
- Write an ADR on the Linux distro choice; i.e. compare Ubuntu, Debian and Alpine
