# Set workspace as caliper-benchmarks root
WORKSPACE=$(cd "$(dirname '$1')/../../.." &>/dev/null && printf "%s/%s" "$PWD" "${1##*/}")
# Nominate a target network
NETWORK=networks/fabric/v2/v2.0.0/2supplierpeercouchdb_raft/api/fabric-api-solo-node-prometheus.yaml
# nominate a target API test
TARGET=couchDB
# Available benchmarks
COUCH_BENCHMARKS=("empty-contract-2of" "create-asset" "create-asset-batch" "get-asset" "get-asset-batch" "mixed-range-query-pagination" "mixed-rich-query-pagination")
# Available phases
PHASES=("caliper-flow-only-start" "caliper-flow-only-init" "caliper-flow-only-install" "caliper-flow-only-test" "caliper-flow-only-end")

# Nominate a benchmark and a phase
BENCHMARK=create-asset
PHASE=caliper-flow-only-start

# Execute
caliper launch master \
--caliper-workspace ${WORKSPACE} \
--caliper-benchconfig benchmarks/api/fabric/${TARGET}/base/${BENCHMARK}.yaml \
--caliper-networkconfig ${NETWORK} \
--caliper-logging-targets-console-options-level error \
--caliper-logging-targets-file-options-level error \
--caliper-fabric-gateway-usegateway \
--${PHASE}