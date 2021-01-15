#/bin/bash
curl -i \
  -H "Content-Type: application/json" \
  -d '
{ "auth": {
    "identity": {
      "methods": ["password"],
      "password": {
        "user": {
          "name": "admin",
          "domain": { "id": "bf50711f246a41d98eb156364e0abb84" },
          "password": "AhHahvai4voh3Oug"
        }
      }
    }
  }
}' \
  "http://blrkeystone.maas:5000/v3/auth/tokens" ; echo