DIR="$( cd "$( dirname "$0" )" && pwd )"
echo $DIR
sudo curl -fsSL  https://go.dev/dl/go1.23.3.linux-amd64.tar.gz --output ./downloads/go1.23.3.linux-amd64.tar.gz
sudo tar -C $HOME -xzf ./downloads/go1.23.3.linux-amd64.tar.gz
