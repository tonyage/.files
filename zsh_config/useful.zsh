gi() {
	curl -sL https://www.gitignore.io/api/$argv >> ./.gitignore;
}

pf() {
cat > "$(pwd)/Pipfile" <<EOF
[[source]]
url = "https://pypi.python.org/simple"
verify_ssl = true
name = "pypi"

[dev-packages]

[packages]
EOF
}
