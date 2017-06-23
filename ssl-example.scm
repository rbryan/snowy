(use snowy openssl)

(define listener (ssl-listen 8000))

(ssl-load-certificate-chain! listener "certificate.pem")
(ssl-load-private-key! listener "key.pem")

(server-listener listener)
(server-accepter ssl-accept)


(accept-loop
 (lambda (req res)
   (display "Woo! ssl connection!")
   (update-response res
     code: 200
     body: "Hello, world!\n")))
