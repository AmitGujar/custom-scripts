showquotes() {
    curl -s https://freefacts.herokuapp.com/facts/random | jq '.[0].name'
}
showquotes
