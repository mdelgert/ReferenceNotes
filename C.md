[How to Install GCC Compiler on Ubuntu](https://linuxize.com/post/how-to-install-gcc-compiler-on-ubuntu-18-04/#:~:text=Perform%20the%20steps%20below%20to%20install%20the%20GCC,which%20prints%20the%20GCC%20version%3A%20gcc%20--version%20)

[run-c-program-linux](https://itsfoss.com/run-c-program-linux/)

sudo apt update
sudo apt install build-essential
sudo apt-get install manpages-dev

nano hello.c

#include <stdio.h>
int main()
{
  printf ("Hello World!\n");
  return 0;
}

gcc hello.c -o hello

./hello

[install-curl-development-library-curl-h-for-c-on-ubuntu](https://www.shayanderson.com/linux/install-curl-development-library-curl-h-for-c-on-ubuntu.htm)

sudo apt-get install libcurl4-openssl-dev

sudo apt-get install libcurl4-gnutls-dev

nano test.c

#include <stdio.h>
#include <string.h>
#include <curl/curl.h>

int main(int argc, char *argv[]){
  CURL *curl;
  CURLcode res;
  curl = curl_easy_init();
  if(curl) {
    curl_easy_setopt(curl, CURLOPT_CUSTOMREQUEST, "GET");
    curl_easy_setopt(curl, CURLOPT_URL, "https://my-json-server.typicode.com/typicode/demo/posts");
    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
    curl_easy_setopt(curl, CURLOPT_DEFAULT_PROTOCOL, "https");
    struct curl_slist *headers = NULL;
    curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
    res = curl_easy_perform(curl);
  }
  curl_easy_cleanup(curl);
  return (int)res;
}

gcc test.c -o test -lcurl

./test

