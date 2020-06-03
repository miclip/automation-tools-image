FROM ubuntu

ENV PIVNET_CLI_VERSION 1.0.3
ENV OM_CLI_VERSION 5.0.0
RUN apt-get update -y && \
apt-get install ca-certificates curl apt-transport-https lsb-release gnupg jq -y && \
curl -L -O https://github.com/pivotal-cf/pivnet-cli/releases/download/v${PIVNET_CLI_VERSION}/pivnet-linux-amd64-${PIVNET_CLI_VERSION} && \
  mv pivnet-linux-amd64-${PIVNET_CLI_VERSION} /usr/local/bin/pivnet && \
  chmod +x /usr/local/bin/pivnet && \
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor |  tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg && \
AZ_REPO=$(lsb_release -cs) && \
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list && \
apt-get update && \
apt-get install azure-cli && \
curl -L -O https://github.com/pivotal-cf/om/releases/download/${OM_CLI_VERSION}/om-linux-${OM_CLI_VERSION} && \
  mv om-linux-${OM_CLI_VERSION} /usr/local/bin/om && \
  chmod +x /usr/local/bin/om

