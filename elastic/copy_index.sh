
old_instance="http://xx.xx.xx.xx:9200"
new_instance="http://xx.xx.xx.xx:9200"

es_indexes=$(curl -s "${old_instance}/_cat/indices" | awk '{ print $3 }')

for index in $es_indexes; do
  elasticdump \
    --input="${old_instance}/${index}" \
    --output="${new_instance}/${index}" \
    --type=mapping

  elasticdump \
    --input="${old_instance}/${index}" \
    --output="${new_instance}/${index}" \
    --type=data
done
