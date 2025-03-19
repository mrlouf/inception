# Inception
### A project hated by many, loved by few

Dear fellow 42 student,\
\
In this repo you will find my complete project that I submitted, and successfully passed.
As tempting as it may be, I strongly discourage you to blindly copy it and pass it as your own, as it sometimes happens.
I do understand that, for many people, the subject of system administration, virtualisation, containers and micro-services may be very abstract, difficult and overall it may seem like a waste of time.
I do believe that to be a decent programmer, you do not only need to be able to write good code, but you should also have a deep understanding of the tools you use to write it.
If you can write programs in C and C++, you should be just as able to implement a simple infrastructure of micro-services using Docker containers and shell scripts.

I personally loved this project. As much as I like writing actual code, I enjoyed the idea of implementing my very own infrastructure.
Granted, it did not do much more than power up a simple Wordpress page using a few services, but I saw that as a good opportunity to 'express' myself in a way.
Consider Minishell for example: your final project was your own. In the end, there are no two projects alike, because every single one is the result of someone's intepretation, effort, commitment, and reasoning.
I see my Inception about the same: it is the result of my own 'creativity' in a way, and it made me relive childhood memories of having my first computer.
In a way, it was a similar experience of trying to install things, try to make them work, fail a lot, not understand why, uninstall them, look it up on the Internet, try again, and finally succeed after hours of hard fight with the machine.

Anyway, I do not blame you if you do not like this project.
Regardless of whether you like it or not, the lack of tutorials and other literature makes it a quite obscure project, and Docker is not exactly a very intuitive tool, especially in the beginning.
As often, it is easier to find a ready-made project that was passed by someone than an actual tutorial that will explain all the key points, and that is a shame.

Having said that, here are a couple of links that might help you start on your Inception journey:
+ https://tuto.grademe.fr/inception/
+ https://medium.com/@ssterdev/inception-guide-42-project-part-i-7e3af15eb671
+ https://github.com/twagger/inception
+ https://github.com/gemartin99/Inception

And a couple of personal tips:
+ If you can, use your personal computer to do the project. The evaluation has to be done on your campus' computers, on a virtual machine with the distribution of your choice but virtual machines are, in my experience, extremely slow and may crash under a big load. If you have a personal computer with a Linux distribution, you can save yourself from a lot of trouble and headaches if you write the project on it instead of the school's computers. Be sure to test extensively your project at school before submission though. It should work as seamlessly as it did at home (after all, that is the very core concept of Docker).
+ If you use your own computer, you will have to install Docker first, and then add your user to the Docker group to run the service. It took me about 5 minutes following the [official Docker's instruction](https://docs.docker.com/engine/install/ubuntu/).
+ Use **'docker logs < container >'** a lot. This command is your best friend for debugging faulty containers, check why your mariadb is not initialised, etc. It has saved me many times over.
+ Be careful when mounting up containers without stopping them first; you should regularly stop and remove them all, remove their images to avoid orphans and build them again if you have made significant changes.
