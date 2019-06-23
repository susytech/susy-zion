#!/bin/bash

cargo doc --no-deps\
	-p bitcrypto\
	-p chain\
	-p db\
	-p import\
	-p keys\
	-p message\
	-p miner\
	-p network\
	-p zion\
	-p p2p\
	-p primitives\
	-p rpc\
	-p script\
	-p serialization\
	-p sync\
	-p test-data\
	-p verification
