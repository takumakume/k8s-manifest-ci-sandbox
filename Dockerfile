FROM ghcr.io/yannh/kubeconform:latest as kubeconform-build
FROM quay.io/fairwinds/pluto:v5 as pluto-build
FROM quay.io/fairwinds/polaris:master as polaris-build
FROM alpine:latest
COPY --from=kubeconform-build /kubeconform /usr/local/bin/kubeconform
COPY --from=pluto-build /pluto /usr/local/bin/pluto
COPY --from=polaris-build /usr/local/bin/polaris /usr/local/bin/polaris
