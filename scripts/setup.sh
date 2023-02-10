#!/bin/bash
mongo <<EOF
   use admin;
   admin = db.getSiblingDB("admin");
   admin.createUser(
     {
	user: "admin",
        pwd: "password",
        roles: [ { role: "root", db: "admin" } ]
     });
     db.getSiblingDB("admin").auth("admin", "password");
EOF