Nowadays a lot of websites provide a customized chatbot to answer customer questions.
With the help of online APIs like OpenAI API or Huggingface inference API creating a chatbot is a simple task.
In addition there is no use to worry about hardware limits or scaling.
However, there might be situations where a chatbot should run locally.
The most common reason is that the data should not leave the local network, when dealing with sensitive information.
For that case AI models can run on local hardware, that provides enough memory and powerful CPUs.
#linebreak()
But what if there are limitations in hardware resources and customers should still be provided with the benefits of a chatbot on a local device?
This is where the project of this bachelor's thesis starts:
#linebreak()
#linebreak()
At work the author was tasked with creating a chatbot running on a local device that is not connected to the internet.
The hardware had limited resources and the chatbot had to be designed in a way that it can run under these circumstances.
#linebreak()
The target device was a Windows PC with only 8 GB of RAM and the chatbot had to share hardware resources with other applications and the operating system.
An additional challenge was that the chatbot had to be able to answer in English, as well as in German.
#linebreak()
Based on this chatbot project this thesis explores the behaviour of different chatbot versions on varying devices.
As a result of the author's initial task the programming languages C\# and Python are used.
All chatbot approaches use Ollama, which is a tool that manages and runs Large Language Models and provides a local API.
The first chatbot versions tests Langflow, a Python tool that offers the possibility to create chatbots and other AI tools without code.
The next chatbot version focuses on mainly using C\# for coding.
This version uses Python.Included that makes it possible to use Python packages in C\# code and OllamaSharp to interact with the local Ollama API.
A third chatbot version consists of a Flask API that interacts with Ollama and C\# WPF application for the user interface.
The difference to the other versions is, that there is a separate translation model for German input and output.
#linebreak()
The chatbot versions are tested and compared with focus on response time as well as response quality and content.
The memory usage (RAM) is tracked as well.
#linebreak()
Finally all chatbot versions run on all test devices, but the response time takes up to two minutes.
Most questions are answered correctly.
The language quality in English is very good, while the German language quality varies in a wide range form perfect to barely understandable.
#linebreak()
The chatbot was tested on a Windows laptop with 32GB of RAM as well as on Windows devices with 8 and 4 GB of RAM.
The thesis includes a detailed comparison and summary of the test results of all chatbot versions on each device.
#linebreak()
In the end an alternative approach is introduced.
It is an AI application, based on a json file including possible questions with predefined answers.
Depending on a user question, the best matching question is found with help of AI and the answer is returned in the according language.
This alternative version is not a chatbot, because it can not generate text and it is not possible to have a conversation with it.
With a well prepared collection of questions and answers this alternative can serve the purpose of customer support and can be executed with limited hardware resources.
The respons time is just a few seconds, because the most resource intensive step of text generation is not necessary.
