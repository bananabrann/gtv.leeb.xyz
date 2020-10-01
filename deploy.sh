# NOTE
# This script builds and deploys GTV to Azure Blob Storage.



# Get the directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Call the biuld script
bash $DIR/build.sh

# Check if .env exists
if [ -f .env ]
then
    # Set environment variables
    AZURE_STORAGE_ACCOUNT=$(cat ./.env | \
                            grep AZURE_STORAGE_ACCOUNT= | \
                            cut -d '=' -f2)

    AZURE_CONTAINER=$(cat ./.env | \
                            grep AZURE_CONTAINER= | \
                            cut -d '=' -f2)

    SAS_TOKEN=$(cat ./.env | \
                            grep SAS_TOKEN= | \
                            cut -c 11-)
fi

# Copy files to Azure storage container
# NOTE - This require azcopy to downloaded. Please see README for instructions.
azcopy cp \
    "$DIR/dist/*" \
    "https://$AZURE_STORAGE_ACCOUNT.blob.core.windows.net/$AZURE_CONTAINER/$SAS_TOKEN" \
    --recursive=true \