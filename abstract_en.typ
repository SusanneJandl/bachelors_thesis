Nowadays a lot of websites provide a chatbot function for customer support.
Many out-of-the-box solutions are available for implementation, usually requiring internet access.
If none of these solutions fit well, it is easy to create a custom chatbot using online APIs like OpenAI API or Huggingface inference API, which are paid services at low cost.
#linebreak()
#linebreak()
But what if there is a local application without internet access and customers should be provided with the benefits of a chatbot?
This is where the project of this bachelor's thesis starts:
#linebreak()
For a software that runs locally without internet access a chatbot had to be created.
The hardware had limited resources and the chatbot had to be designed in a way that it can run under these circumstances.
#linebreak()
The target device is a Windows PC with a RAM of 8GB and a CPU with 4 cores.
An additional challenge is that the chatbot has to be able to answer in English, as well as in German.
#linebreak()
To achieve this goal, multiple approaches were tested.
The frist idea to fine-tune a pretrained large language model (LLM) with the necessary information for the chatbot, did not work well.
After trying out some other possible solutions that will be mentioned in this thesis, the final solution contains the use of RAG (retrieval-augmented generation) where the product specific information for the chatbot is stored in a vector store and using Ollama. Ollama is a tool that manages Large Language Models.
The result worked, but did not meet the expectations users would have when using a chatbot.
For the developer, it was a success to make the chatbot work, though it took up to a minute to retrieve an answer and the language quality was not good.
In the categorization made for AI output quality the chatbot's answers were rated as partially correct in spelling and grammar, as well as in correctness of content.
#linebreak()
To sum it up, the result was a chatbot that could answer questions, but the answers were not always correct, the language quality was not good, and the response time was too long.
#linebreak()
The chatbot was tested on other devices as well, such as a Windows laptop with 32GB of RAM and a MacBook with an M1 chip.
On both machines, the chatbot worked well, even when using a larger LLM to achieve better answers.
#linebreak()
The latest approach to retrieve a usable result for the target device is an AI application that uses AI for translation and retrieval.
The provided information for the chatbot is a json file with English questions and predefined answers in German and English.
The question with the highest similarity to the user input is retrieved from the json file and the corresponding answer is returned.
This will only be discussed as alternative solution because no ongoing conversation is possible, which is a key feature of a chatbot.
