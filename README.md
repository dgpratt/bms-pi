# bms-pi : Experiments in Calculating π in Haskell

## Building

Assuming Docker is installed, the easiest way to build will be running `bin/docker-build`.

## Running

If successfull, the build command above will output the executable to `./result/bin/bms-pi`. Running the executable directly will calculate π via the "conforming" strategy. Adding ` -v atan` to the command will calculate π the fast way. Alternately, adding ` -v asin` to the command will calculate π another way (using the Asin function).