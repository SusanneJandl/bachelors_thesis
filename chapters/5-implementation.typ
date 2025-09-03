#import "global.typ": *
//① ② ③ ④ ⑤ 
= #titles.implementation <cha:implementation>

In the following sections insights of the different implementations and technologies are provided.

== #titles.langflowapproach <sec:langflowimpl>

Langflow works without any coding effort.
Python 3.10 is required for the Langflow version used in this work.
The command to start langflow in background is `python -m langflow run --port 7888 --backend-only`.
With `-m` the location of Langflow is detected automatically.
`--port 7888` specifies the port on which Langflow will run in the background.
`--backend-only` means that only the backend is started, and the user interface is not started in the browser.

The following code part shows how easy the workflow can be addressed using the widget.
The widget can be added to any html page.

  #figure(
    align(
      left, fhjcode(code: read("../code/index.html"), firstline: 8, lastline: 16),
    ), caption: flex-caption(
      [Adding the Chat Widget to an HTML Page.],
      [Adding the Chat Widget to an HTML Page.],
    ),
  ) <lst:Chatwidget>

  @lst:Chatwidget demonstrates the integration of the chat widget into an HTML page.
  The title is adaptable, and the flow id and url need to be added.
  The script is provided by langflow-ai #cite(<LangflowEmbeddedChat:2025>) and has to be included as well.

== #titles.csharpapproach <sec:csharpimpl>

For this chatbot implementation, in a first step a new Langflow workflow is created. Then the python script is developed, that will later be accessed from Python.Included in C\#.
The purpose of the script is to retrieve the context from the vector store using the Langflow workflow that runs in the background.
The C\# console application finally uses the produced components, and integrates them into the application.

=== #titles.csharplangflow <subsec:csharplangflow>

After creating the vector store as shown in @fig:LangflowRAG in @sec:langflowapproach, the next step is to create a new workflow that outputs the context from the vector store, based on the user query.
Figure @fig:LangflowWorkflow shows the new workflow.

#figure(
    box(stroke: gray, inset: 0.5em, width: 80%,
      image("../figures/LangflowRetrieval.png")
    ),
    caption: flex-caption(
        [Retrieving context with Langflow Workflow.],
        [Retrieving context with Langflow Workflow.],
    )
  )<fig:LangflowWorkflow>

With help of the embedding model (all-minilm:22m) #text(1.3em)[①], that must be the same as used for vector store creation, the user query #text(1.3em)[②] is transformed into a vector and compared to the existing vectors in the vector store #text(1.3em)[③].
The output of the vector store is converted from vectors to text #text(1.3em)[④].
The final step outputs the text #text(1.3em)[⑤].
These text chunks are then provided in JSON format for further processing.

=== #titles.csharppython <subsec:csharppython>


=== #titles.csharppythonincl <subsec:csharppythonincl>
=== #titles.csharpollama <subsec:csharpollama>
== #titles.flaskapiapproach <sec:flaskapiimpl>
=== #titles.flaskapi <subsec:flaskapi>
=== #titles.userinterface <subsec:userinterface>