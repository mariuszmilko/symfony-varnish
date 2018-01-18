vcl 4.0;
backend default {
    .host = "app.mmilko.git";
    .port = "80";
    .connect_timeout = 1s; # Wait a maximum of 1s for backend connection (Apache, Nginx, etc...)
    .first_byte_timeout = 5s; # Wait a maximum of 5s for the first byte to come from your backend
    .between_bytes_timeout = 2s; # W
}

sub vcl_recv {
    if (req.method != "GET" && req.method != "HEAD") {
        return (pass);
    }
    return (hash);
}