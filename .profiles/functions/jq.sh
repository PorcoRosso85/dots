# jqjc() {
#   # https://richrose.dev/posts/linux/jq/jq-json2csv/
#   jq -r '.stock[] | [.id, .item, .description] | @csv' $1
# }

# jqjm() {
#   # https://gist.github.com/mrVanboy/4472ead613102b382691b3b28ae03ae4
#   jq -r '. | sort_by((.location.path | explode | map(-.)), .location.lines.begin) | .[] | @text "| [\(.location.path):\(.location.lines.begin)](../blob/BRANCH-NAME/\(.location.path)#L\(.location.lines.begin)) | \(.description)"' gl-code-quality-report.json
# }

# jqcj() {
#   # https://qiita.com/mj69/items/80a3a18210a4fa28ff44
#   # https://rafaelleru.github.io/blog/json-magic-vim/
#   jq -R -s -f $1 $2 |jq 'del(.[][] | nulls)'\
#   |head -n -2 | sed -e 1d -e 's/},/}/g' | jq . -c|\
#   sed "s/^/{ \"index\" :{} }\n/g" > $3
#   #echo $(jq '.' $3) > $3
#   # $1:mapping file, $2:target csv
# }

jqjc_group() {
  case $1 in
    "jc")
      shift # $1を削除して、$2が$1に、$3が$2に、...
      jqjc "$@"
      ;;
    "jm")
      shift
      jqjm "$@"
      ;;
    "cj")
      shift
      jqcj "$@"
      ;;
    *)
      echo "Invalid argument. Use 'jc', 'jm', or 'cj'."
      ;;
  esac
}

jqjc() {
  jq -r '.stock[] | [.id, .item, .description] | @csv' $1
}

jqjm() {
  jq -r '. | sort_by((.location.path | explode | map(-.)), .location.lines.begin) | .[] | @text "| [\(.location.path):\(.location.lines.begin)](../blob/BRANCH-NAME/\(.location.path)#L\(.location.lines.begin)) | \(.description)"' gl-code-quality-report.json
}

jqcj() {
  jq -R -s -f $1 $2 | jq 'del(.[][] | nulls)' | head -n -2 | sed -e 1d -e 's/},/}/g' | jq . -c | sed "s/^/{ \"index\" :{} }\n/g" > $3
}