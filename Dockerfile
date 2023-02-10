FROM mongo:4.4
COPY scripts/file.key data/file.key
COPY scripts/users.js /tmp/users.js

RUN mongod --fork --logpath /var/log/mongodb.log \
    && sleep 5 \
    && mongo admin /tmp/users.js


ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 27017

CMD ["mongod"]