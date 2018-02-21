#!/usr/bin/env bash

# o 'nmcli' está disponível em máquinas com o network manager (ex: ubuntu)
# é necessário até que tenhamos uma maneira simples de - de dentro do
# do container - acessar o dns do host
cat << EOF > /usr/local/bin/aws
#!/usr/bin/env bash
docker run --rm -it \\
    -v \$(pwd):/aws \\
    -e AWS_SECRET_ACCESS_KEY="\$AWS_SECRET_ACCESS_KEY" \\
    -e AWS_ACCESS_KEY_ID="\$AWS_ACCESS_KEY_ID" \\
    -e AWS_DEFAULT_REGION="\$AWS_DEFAULT_REGION" \\
    --dns=$(nmcli dev show | grep 'DNS\[1\]' | awk '{print $NF}') \\
    seiti/aws-cli \\
    "\$@"
EOF

cat << EOF > /usr/local/bin/aws-shell
#!/usr/bin/env bash
docker run --rm  -it --entrypoint=aws-shell \\
    -v \$(pwd):/aws \\
    -v ~/.aws:/root/.aws \\
    -e AWS_SECRET_ACCESS_KEY="\$AWS_SECRET_ACCESS_KEY" \\
    -e AWS_ACCESS_KEY_ID="\$AWS_ACCESS_KEY_ID" \\
    -e AWS_DEFAULT_REGION="\$AWS_DEFAULT_REGION" \\
    --dns=$(nmcli dev show | grep 'DNS\[1\]' | awk '{print $NF}') \\
    seiti/aws-cli
EOF

chmod a+x /usr/local/bin/aws-shell
chmod a+x /usr/local/bin/aws
