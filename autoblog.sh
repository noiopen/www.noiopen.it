#!/bin/bash
cd "$(dirname $0)"
# category Blog
C=16
for id in $(curl -sL https://noiopen.discourse.group/c/$C.json | jq .topic_list.topics[].id)
do 
   curl -sL "https://noiopen.discourse.group/t/$id.json" >$id.json
   mkdir -p content/post/forum/$id
   slug="$id/$(jq -r '.post_stream.posts[0].topic_slug' $id.json).md"
   tgt="content/post/forum/$slug"
   jq -r -f autoblog.jq <$id.json >$tgt
done

