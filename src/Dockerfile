FROM alpine:3.19

RUN apk add --no-cache bash

WORKDIR /app

COPY process_logs.sh .

RUN chmod +x process_logs.sh

CMD ["/bin/bash", "./process_logs.sh"]