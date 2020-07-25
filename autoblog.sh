#!/bin/bash
cd "$(dirname $0)"
# category Blog
C=16
mkdir -p content/post/forum
for id in $(curl -sL https://noiopen.discourse.group/c/$C.json | jq .topic_list.topics[].id)
do 
   tgt="content/post/forum/$id.md"
   curl -sL https://noiopen.discourse.group/t/$id.json | jq -r -f autoblog.jq >$tgt
done

