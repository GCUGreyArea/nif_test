# Fetch a stable Linux OS
FROM ubuntu:18.04

# Import my RSA key to allow for github clone (it's been copied to the Docker build dir)
# ADD id_rsa /root/.ssh/id_rsa
# RUN chmod 600 /root/.ssh/id_rsa

# ADD . /libalalgo

# Run apt update then install to fetch required build tools 
RUN apt-get update
RUN apt-get install -y flex bison gcc g++ cmake curl git libssl-dev automake autoconf libncurses5-dev fop libtool libpcre2-dev ragel libboost-all-dev
RUN curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl
RUN chmod +x kerl
RUN mv kerl /usr/local/bin

# Needed for Erlang to work inside a Docker
EXPOSE 8080
EXPOSE 8443

# https://intel.github.io/hyperscan/dev-reference/getting_started.html
# RUN git clone git://github.com/intel/hyperscan
# RUN mkdir -p hyperscan/build
# RUN cd hyperscan/build && cmake -DBUILD_SHARED_LIBS=true -G "Unix Makefiles" .. && make && make install

# # Clone the repository into the local drive
# RUN git clone https://algithub.pd.alertlogic.net/alertlogic/libalalgo
ADD . /nif_test