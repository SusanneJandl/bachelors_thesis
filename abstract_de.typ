Viele Websites bieten heutzutage eigene Chatbots zur Beantwortung von Kundenfragen.  
Mit der Hilfe von Online-APIs wie der OpenAI API oder der Huggingface Inference API ist es einfach, einen individuellen Chatbot zu erstellen.
Ausserdem ist es somit nicht notwendig sich mit Hardware Limits oder Skalierung auseinanderzusetzen.
Es kann jedoch Situationen geben, in denen ein Chatbot lokal ausgeführt werden soll.
Der häufigste Grund dafür ist, dass die Daten das lokale Netzwerk nicht verlassen sollen, wenn sensible Informationen verarbeitet werden.
Für diesen Fall können KI-Modelle auf lokaler Hardware ausgeführt werden, die über ausreichend Speicherplatz und leistungsstarke CPUs verfügt.
#linebreak()
Doch wie kann Kunden bei begrenzten Hardware-Ressourcen dennoch der Nutzen eines Chatbots auf einem lokalen Gerät geboten werden?
An diesem Punkt setzt das Projekt dieser Bachelorarbeit an:
#linebreak()
#linebreak()
Die Autorin wurde in Ihrem Ausbildungsbetrieb damit beauftragt, einen Chatbot zu erstellen, der lokal ausgeführt wird und nicht mit dem Internet verbunden ist. 
Die Hardware hatte begrenzten Ressourcen, und der Chatbot musste so gestaltet werden, dass er unter den gegebenen Bedingungen funktioniert.  
#linebreak()  
Das Zielgerät war ein Windows-PC mit nur 8 GB RAM und der Chatbot muss die Hardware-Ressourcen mit anderen Anwendungen und dem Betriebssystem teilen.
Eine weitere Herausforderung bestand darin, dass der Chatbot sowohl auf Englisch als auch auf Deutsch antworten sollte.
#linebreak()  
Basierend auf diesem Chatbot Projekt, erforscht diese Bachelorarbeit das Verhalten von unterschiedlichen Chatbot Versionen auf verschiedenen Geräten.
Die verwendeten Programmiersprachen sind Python und C\#, da das eine Anforderung des ursprünglichen Chatbot Projekts war.
Für alle Herangehensweisen wird Ollama, ein Tool, das Sprachmodelle verwaltet und über eine lokale API ausführt und zur Verfügung stellt, verwendet.
Die erste Chatbot Version testet Langflow, ein Python Tool, das es ermöglicht, Chatbots und andere KI Anwendungen ohne Code zu erstellen.
Die nächste Chatbot Version konzentriet sich darauf, hauptsächlich C\# als Programmiersprache zu verwenden.
In dieser Version wird Python.Included verwendet, was es ermöglicht, Python Packages in C\# Code zu verwenden.
Außerdem wird OllamaSharp genutzt um mit der lokalen Ollama API zu interagieren.
Die dritte Chatbot Version besteht aus einer Flask API, die mit Ollama interagiert und einer C\# WPF Applikation als Benutzeroberfläche.
Ein Unterschied zu den anderen Versionen ist, dass ein separates Sprachmodell für die Übersetzung für deutsche Ein- und Ausgaben enthalten ist.
#linebreak()  
Die verschiedenen Chatbot-Ansätze werden getestet und verglichen, wobei der Fokus auf der Antwortzeit sowie der Qualität des Inhalts und der Sprache der Antworten liegt.
Zusätzlich wird die Speichernutzung (RAM) gemessen.
#linebreak()  
Alle Chatbot Versionen können auf allen Testgeräten ausgeführt werden.
Allerdings beträgt die Antwortzeit bis zu zwei Minuten.
Die meisten Fragen werden inhaltlich korrekt beantwortet.
Die Sprachqualität auf Englisch ist sehr gut, während die deutsche Sprachqualität von perfekt bis kaum verständlich variiert.
#linebreak()  
Der Chatbot wurde auch auf einem Windows-Laptop mit 32 GB RAM und auf Windows-PCs mit 8 und 4 GB RAM getestet.
Dies Arbeit enthält einen detaillierten Vergleich und eine detaillierte Zusammenfassung der Testergebnisse aller Chatbot Versionen auf allen Geräten.
#linebreak()
Zum Schluss wird ein alternativer Ansatz vorgestell.
Dabei handelt es sich um eine KI Applikation, die eine json-Datei mit möglichen Fragen und vordefinierten Antworten enthält.
Mit Hilfe von KI wird die ähnlichste Frage zur Nutzereingabe gefunden und die vordefinierte Antwort wird in der entsprechenden Sprache ausgegeben.
Diese alternative Version ist allerdings kein Chatbot, da kein Text generiert wird und es nicht möglich ist, eine Konversation zu führen.
Mit einer gut vorbereiteten Sammlung von Fragen und Antworten, kann diese Alternative den Zweck des Kunden-Supports erfüllen und mit geringen Hardware-Ressourcen ausgeführt werden.
Die Antwortzeit beträgt nur wenige Sekunden, da der ressourcenintensivste Schritt, der Textgenerierung entfällt.