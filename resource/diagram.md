CLIENT (Browser)                                NGINX (Proxy)

      |                                              |
      | 1. Client Hello (TLS Version, Cipher Suites, |
      |    Random Number)                            |
      |--------------------------------------------->|
      |                                              |
      | 2. Server Hello (Chosen Cipher, Random Num,  |
      |    SSL Certificate + Public Key)             |
      |<---------------------------------------------|
      |                                              |
      | 3. VERIFICATION: Client checks Cert against  |
      |    built-in Root CA Public Keys. (No SMS!)   |
      |                                              |
      | 4. KEY EXCHANGE: Client creates "Pre-master  |
      |    Secret", encrypts it with SERVER'S        |
      |    Public Key.                               |
      |--------------------------------------------->|
      |                                              |
      | 5. DECRYPTION: Server uses its PRIVATE KEY   |
      |    to get the Secret.                        |
      |                                              |
      | 6. SESSION START: Both generate same         |
      |    "Symmetric Session Key".                  |
      |                                              |
      | <==== ALL FUTURE DATA IS ENCRYPTED ====>     |
      |                                              |
