#import "global.typ": *

= #titles.related <cha:related>

There are some thesis dealing with the development of chatbots.
The big difference to this work is either the available hardware or if there are hardware restrictions, the use of an online platform where the models do not run locally on the device.

#cite(<Chaudhary:2024>, form: "prose") describes a concept to create an offline chatbot.
It is a Llama-based chatbot for answering question about a CI/CD for a specific company.
An additional step to get better answers with shorter response time is to rewrite the query with help of an LLM and a rewriting template.
They also use a RAG approach but include updating the information in the vector store on a regular basis.

A huge difference to this thesis is that #cite(<Chaudhary:2024>, form: "prose") used a Kubernetes pod containing an Intel Xeon Gold 6230N CPU with 40 GB of RAM and an Nvidia Tesla T4 GPU with 16 GB of GDDR6 memory.

The work of #cite(<Zhang:2025>, form: "prose") also deals with the creation of an offline chatbot, but the available hardware is more powerful than the hardware used in this thesis.
They use an Intel® Xeon(R) W-2155 CPU with 64 GB of memory, and a GeForce 4090 GPU (24GB) on a Linux system.

This thesis focuses on running a chatbot with less hardware resources and different devices, like Windows laptops with 32, and 8 GB of RAM using only CPU.

An other related approach by #cite(<Sakai:2024>, form: "prose") deals with using LLMs on a Raspberry Pi 4 Model B with 8GB of RAM.
The content of the thesis includes additional features like voice recognition and text-to-speech, as well as taking pictures.
The work succeeds in running AI models on the Raspberry Pi but does not use a RAG approach.
They focus on response time and memory usage.

Other sources, such as #cite(<Athanasios:2024>) @Fan:2024 @Gao:2023 @Golla:2024 @Ko:2024 @Kofler:2025 @Liu:2024 @Lewis:2020 @Yee:2024 @Zhang:2025, include components discussed in this thesis, like using Ollama, RAG, and LLMs in general and are referenced for general information about used technologies.

Additional research underscores that fine-tuning remains costly and resource intensive compared to RAG, which offers flexibility and adaptability without introducing heavy computational trade-offs.

The combination of offline functionality, using RAG, and limited hardware resources could not be found in the literature reviewed.
This thesis aims to bridge this gap.
