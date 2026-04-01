# Test TLS 1.0 (should FAIL ❌)
    openssl s_client -connect localhost:443 -tls1


# Test TLS 1.1 (should FAIL ❌)
    openssl s_client -connect localhost:443 -tls1_1


# Test TLS 1.2 (should WORK ✅)
    openssl s_client -connect localhost:443 -tls1_2

# Test TLS 1.3 (should WORK ✅)
    openssl s_client -connect localhost:443 -tls1_3


for tls in 1 1_1 1_2 1_3; do
    echo "Testing TLS $tls..."
    openssl s_client -connect localhost:443 -$tls </dev/null 2>/dev/null \
    | grep -E 'Protocol|Cipher'
done
