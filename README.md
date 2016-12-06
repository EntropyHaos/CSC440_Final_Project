# CSC440 Final Project - TEAM FIVE

**Version : -0.009** *(yes, a negative value...)*

## Wat?

**Team Five's CSC440 Final Project Repo**

*This readme contains recomendations related to workflow and best practice for dev.*

## How?

### Test/Demo the current development:

* Fork the repository on Github.
* Create a **new** Cloud9 VM.
* Clone your fork in the new VM.
    * ```git clone <URL or SSH for your fork> <name of folder to place clone>```
* Run VM setup script.
    * ```bash <name of folder to place clone>/Z_RUNME.bash```
* Switch your terminal shell to the repo.
    * ```cd <path to clone>/```
* Start the MongoDB Server
    * ```bash mongodb_run.bash```
* Use Maven to run/install the program.
    * ```mvn spring-boot:run```

### Work on the current development:

* Fork the repository on Github.
* Create a **new** Cloud9 VM.
* Clone your fork in the new VM.
    * ```git clone <URL or SSH for your fork> <name of folder to place clone>```
* Run VM setup script.
    * ```bash <name of folder to place clone>/Z_RUNME.bash```
* Switch your terminal shell to the repo.
    * ```cd <path to clone>/```
* At this point you could start the MongoDB server and run the program.
    * ```bash mongodb_run.bash```
    * ```mvn spring-boot:run```
* Use ```ctrl-c``` to stop the program and Cloud9's proccess kill to stop MongoDB
* Unless you are doing small modifications or fixes, create a feature branch.
    * ```git flow feature start <your features name>```
* Modify, change, test, whatever, in your feature branch. **(See notes below!)**
* Once you are satisfied with your changes, merge them into the dev branch.
    * ```git flow feature finish <your features name>```
* Push the changes to your fork.
    * ```git add --all```
    * ```git commit -m "<Commit message>"```
    * ```git push --all```
* Create a pull request on GitHub from your fork to the CSC440 fork.
 
## IMPORTANT NOTES

### The Branching Structure

#### Permanent Branches:

* The **master** branch:
    * Is for release(s) only.
    * Will contain work submitable as the final project.
    * Will have instruction for demonstrating and working on the project.
    * When modified on org member forks:
        * Be immediately published to the fork.
        * Have a pull request with explanation/comment created.
    * When modified on main org repo:
        * Be merged into member forks as soon as possible.
        * Absolutely be merged before any pull requests are made to org repo.
* The **develop** branch:
    * Must be buildable for all group members.
    * Contains functioning code that is utilized and/or utilizable when built.
    * Code that is not utilized, but utilizable, is limited to artifacts utlized by feature branches.
    * When modified on org member forks:
        * Be immediately published to the fork.
        * Have a pull request with explanation/comment created.
    * When modified on main org repo:
        * Be merged into member forks as soon as possible.
        * Absolutely be merged before any pull requests are made to org repo.

#### Semi-Permanent Branches:

* The **feature** branch(es):
    * Are for anything that is not covered by the above descriptors.
    * Should be published if it contains significant change(s) in direction of the project.
    * Should be published if comments/recomendations/help are desired.
    * Should be published if there is any chance it might be useful to the team.
    * Should be published if it contains any working mods, hacks, or sketches.
    * Should be published if you are done working on it for any amount of time.
    * Should just be published! (Unless you are working on it.)

#### NEVER-Permanent Branches:

* Any **hotfix** branch(es):
    * Will be work to fix bugs/defects in the master/release branch.
    * Should be activily worked on and published often.
* Any **support** branch(es): (Hopefully not needed...)
    * Would/Will contain what is needed to test and dev on different versions of the project.
    * Should be activily worked on and published often.

#### Publishing (*pushing to your fork.*)

* You can use GitFlows publishing commands or do the usual add/commit/push routine.
* Should be done regularly.

#### Commiting

* Should be done often.

### Pushing to the main Org repo.

* Must be done anytime changes are made to the master or dev branch excepting for testing.
* Must be done if you intend to merge in a feature that causes changes to the code base.
* Must contain working master and dev branches.
* Must contain only "clean" src in master branch.
    * Run ```mvn clean``` before pushing.
* Must contain only "clean" src in develop branch.
    * Run ```mvn clean``` before pushing.
* Should be done anytime there are features the group should be aware of.
 
