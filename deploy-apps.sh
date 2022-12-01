#!/bin/bash


DEPLOYMENT_FILE="deployment.yaml"
DEPLOYMENTS_GLOB=( ./*/"$DEPLOYMENT_FILE" )
STARTING_PROMPT="Available deployments:"
SELECTION_PROMPT="Type to check deployments (again to uncheck, ENTER when done): "
NOT_FOUND_ERROR="Error! Not found: "
SELECTION_CHAR="X"


g_selections=() # Used to track what deployments the user has already selected
g_invalidSelections=() # Used to track what response tokens did not match to a deployment
g_deploymentFiles=() # Used to track the pathname of deployment.yaml files
g_deploymentDirs=() # Used to track the dirs which contain a deployment.yaml file


# This function gets called once before building any of the deployments are built
function preBuildSteps () {
  eval "$(minikube -p parca-demo docker-env)"
}

# This function gets called once for each deployment the user selected to build
#
# arg 1: the directory the deployment is found
# arg 2: the path to the deployment file
function buildSteps () {
  echo "Building the '$1' demo"
  make -C "$1" build
  kubectl apply -f "$2"
}

# This function collects the names and the deployment.yaml files for each deployment
function findDeployments () {
  for file in "${DEPLOYMENTS_GLOB[@]}" ;  do
    if [ -e "$file" ] ; then  # Make sure it isn't an empty match
      g_deploymentFiles+=("$file")
      g_deploymentDirs+=( "$(basename "$(dirname "$file")")" )
      g_selections+=( "" ) # mark as not selected
    fi
  done
}

# This function checks if a deployment is already selected or not then toggles it
#
# arg 1: the 0-based deployment index to toggle
function toggleSelection () {
  if [ "${g_selections[$1]}" == "" ] ; then
    g_selections[$1]="$SELECTION_CHAR"
  elif [ "${g_selections[$1]}" == "$SELECTION_CHAR" ] ; then
    g_selections[$1]=""
  fi
}

# This function parses a user's string response token by checking if there are any
# deployments with the same name and returns its 0-based index
#
# arg 1: user's response token
function findDeploymentIndexFromString () {
  for i in "${!g_deploymentDirs[@]}" ; do
    if [ "${g_deploymentDirs[$i]}" == "$1" ] ; then
      echo "$i"
    fi
  done
}

# This function parses a user's valid integer response token by changing their
# 1-based index to a 0-based index
#
# arg 1: user's response token
function findDeploymentIndexFromInteger () {
  if (( 1 <= $1 && $1 <= ${#g_selections[@]} )) ; then
    echo "$(($1 - 1))"
  fi
}

# This function attempts to match the user's response token to a valid deployment
# configuration. It calls the appropriate function depending on if the token is
# an integer or a string
#
# arg 1: user's response token
function findDeploymentIndex () {
  deploymentIndex=$(findDeploymentIndexFromInteger "$1")
  if [ "$deploymentIndex" ] ; then
    echo "$deploymentIndex"
    return
  fi

  deploymentIndex=$(findDeploymentIndexFromString "$1")
  if [ "$deploymentIndex" ] ; then
    echo "$deploymentIndex"
    return
  fi
}

# This function parses the user's whitespace-delimited response. It identifies which
# tokens are valid and keeps track of which ones aren't
#
# vargs: array of user's response tokens
function parseResponse () {
  g_invalidSelections=()

  for item in "$@" ; do
    deploymentIndex=$(findDeploymentIndex "$item")
    if [ "$deploymentIndex" ] ; then
      toggleSelection "$deploymentIndex"
    else
      g_invalidSelections+=( "$item" )
    fi
  done
}

# This function parses the arguments that were provided to this script in the terminal.
# It identifies which tokens are valid and keeps track of which ones aren't.
#
# vargs: array of script's arguments
function parseArguments () {
  for item in "$@" ; do
    deploymentIndex=$(findDeploymentIndexFromString "$item")
    if [ "$deploymentIndex" ] ; then
      toggleSelection "$deploymentIndex"
    else
      g_invalidSelections+=( "$item" )
    fi
  done
}

# This function prints the list of deployments a user can select alongside an index
# and a text-based checkbox to indicate if it selected already
function printDeploymentOptions () {
  echo # blank line
  echo "$STARTING_PROMPT"
  for i in "${!g_deploymentDirs[@]}" ; do
    printf "%3s [%1s] %s\n" "$((i+1))" "${g_selections[$i]}" "${g_deploymentDirs[$i]}"
  done
}

# This function prints the list of invalid selections the user made
function printInvalidSelections () {
  if [ "${#g_invalidSelections[@]}" -ne 0 ] ; then
    echo "$NOT_FOUND_ERROR ${g_invalidSelections[*]}"
    return 1
  fi
}

# This function displays the list of deployments to the users and records their
# input in a loop until they pass an empty line
function promptForDeploymentSelection() {
  while true ; do
    printDeploymentOptions
    printInvalidSelections

    read -p "$SELECTION_PROMPT" -ra response
    if [ "${#response[@]}" -eq 0 ] ; then
      break # no response received
    fi

    parseResponse "${response[@]}"
  done
}

# This function loops though all selected deployments and builds them
function buildSelectedDeployments () {
  for i in "${!g_selections[@]}" ; do
    if [ "${g_selections[i]}" == "$SELECTION_CHAR" ] ; then
      buildSteps "${g_deploymentDirs[$i]}" "${g_deploymentFiles[$i]}"
    fi
  done
}

# This function build the deployments specified as arguments to this script if there are
# any available. Otherwise, it will prompt the user to select some.
#
# vargs: array of script's arguments
function selectDeploymentsFromArgumentsElsePrompt () {
  if [ "$#" -ne 0 ] ; then
    parseArguments "$@"
    printInvalidSelections || exit 1
  else
    promptForDeploymentSelection
  fi
}



findDeployments
selectDeploymentsFromArgumentsElsePrompt "$@"
preBuildSteps
buildSelectedDeployments