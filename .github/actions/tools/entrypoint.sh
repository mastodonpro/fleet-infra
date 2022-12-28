#!/bin/bash

set -eu

YQ_VERSION="v4.6.1"
KUSTOMIZE_VERSION="4.2.0"
KUBEVAL_VERSION="0.15.0"
KUBECONFORM_VERSION="0.4.13"

mkdir -p $GITHUB_WORKSPACE/bin

curl -sL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -o yq

cp ./yq $GITHUB_WORKSPACE/bin
chmod +x $GITHUB_WORKSPACE/bin/yq

kustomize_url=https://github.com/kubernetes-sigs/kustomize/releases/download && \
curl -sL ${kustomize_url}/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz | \
tar xz
cp ./kustomize $GITHUB_WORKSPACE/bin
chmod +x $GITHUB_WORKSPACE/bin/kustomize

curl -sL https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz | \
tar xz
cp ./kubeval $GITHUB_WORKSPACE/bin
chmod +x $GITHUB_WORKSPACE/bin/kubeval

# https://github.com/yannh/kubeconform/releases/download/v0.4.13/kubeconform-linux-amd64.tar.gz
kubeconform_url=https://github.com/yannh/kubeconform/releases/download && \
curl -sL ${kubeconform_url}/v${KUBECONFORM_VERSION}/kubeconform-linux-amd64.tar.gz | \
tar xz
cp ./kubeconform $GITHUB_WORKSPACE/bin
chmod +x $GITHUB_WORKSPACE/bin/kubeconform

echo "$GITHUB_WORKSPACE/bin" >> $GITHUB_PATH
echo "$RUNNER_WORKSPACE/$(basename $GITHUB_REPOSITORY)/bin" >> $GITHUB_PATH
