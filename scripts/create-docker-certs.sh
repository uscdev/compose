export HOST=0.0.0.0.xip.io
export PASSWORD=password
export COUNTRY=US
export STATE=California
export CITY=Los\ Angeles
export ORGANIZATION=University\ of\ Southern\ California
export UNIT=Information\ Technology\ Services
export EMAIL=dcorley\@usc.edu
export OTHER_HOSTS=DNS:0.0.0.0.xip.io,DNS:*.0.0.0.0.xip.io,DNS:127.0.0.1.xip.io,DNS:*.127.0.0.1.xip.io,DNS:docker-proxy,IP:127.0.0.1,IP:0.0.0.0

#  on the Docker daemon’s host machine, generate CA private and public keys
openssl genrsa -aes256 -out ca-key.pem 4096

openssl req -new -x509 -days 365 -subj "/C=$COUNTRY/ST=$STATE/L=$CITY/O=$ORGANIZATION/OU=$UNIT/CN=$HOST" -key ca-key.pem -sha256 -out ca.pem

# create a server key and certificate signing request (CSR).
# Make sure that “Common Name” matches the hostname you use to connect to Docker
openssl genrsa -out server-key.pem 4096
openssl req -subj "/CN=$HOST" -sha256 -new -key server-key.pem -out server.csr

echo subjectAltName = $OTHER_HOSTS >> extfile.cnf
echo extendedKeyUsage = serverAuth >> extfile.cnf

openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile extfile.cnf

# For client authentication, create a client key and certificate signing request:

openssl genrsa -out key.pem 4096
openssl req -subj '/CN=client' -new -key key.pem -out client.csr

echo extendedKeyUsage = clientAuth >> extfile.cnf
openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out cert.pem -extfile extfile.cnf

rm -v client.csr server.csr
chmod -v 0400 ca-key.pem key.pem server-key.pem
chmod -v 0444 ca.pem server-cert.pem cert.pem

mkdir client-certs
mkdir server-certs
cp cert.pem key.pem ca.pem client-certs/
cp server-key.pem server-cert.pem ca.pem server-certs/
rm -vf cert.pem key.pem ca.pem server-key.pem server-cert.pem
rm -vf ca-key.pem ca.srl cert.pem extfile.cnf
