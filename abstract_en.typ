Nowadays a lot of websites provide a chatbot function for customer support.
It is easy to create a custom chatbot using online APIs like OpenAI API or Huggingface inference API, which are paid services.
However, there might be situations where a chatbot or assistant should run locally.
The most common reason is that the data should not leave the local network, for example when dealing with sensitive information.
For that case AI models can run on local hardware, but the hardware has to be powerful enough.
#linebreak()
But what if there are limitations in hardware resources and customers should still be provided with the benefits of a chatbot on a local device?
This is where the project of this bachelor's thesis starts:
#linebreak()
#linebreak()
For a software that runs locally without internet access a chatbot had to be created.
The hardware had limited resources and the chatbot had to be designed in a way that it can run under these circumstances.
#linebreak()
The target device is a Windows PC with only 8 GB of RAM and of course the chatbot has to share hardware resources with other applications and the operating system.
An additional challenge is that the chatbot has to be able to answer in English, as well as in German.
#linebreak()
To achieve this goal, multiple approaches were tested.
The first idea to fine-tune a pretrained large language model (LLM) with the necessary information for the chatbot, did not work well.
After a series of experiments using RAG (retrieval-augmented generation) where the product specific information for the chatbot is stored in a vector store, a working solution was found.
All chatbot approaches use Ollama, which is a tool that manages Large Language Models.
The final implementation worked, but did not meet the expectations users would have when using a chatbot.
The response time was too long, and the quality of the answers was not satisfactory.
For the developer, it was still a success to make the chatbot work at all.
#linebreak()
The different chatbot approaches were tested and compared with focus on response time and quality of content and language of the answers.
#linebreak()
To sum it up, the result was a chatbot that could answer questions, but the answers were not always correct, especially the German language quality was not good, and the response time was too long.
#linebreak()
The chatbot was tested on a Windows laptop with 32GB of RAM as well.
On this machine, the chatbot worked well, even when using a larger LLM to achieve better response quality.
#linebreak()
The latest approach to retrieve a usable result for the target device is an AI application that uses AI for translation and retrieval.
The provided information for the chatbot is a json file with English questions and predefined answers in German and English.
The question with the highest similarity to the user input is retrieved from the json file and the corresponding answer is returned.
This will only be discussed as alternative solution because no ongoing conversation is possible, which is a key feature of a chatbot.
