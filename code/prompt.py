 import requests

 def query_langflow(message: str) -> str:
     url = "http://127.0.0.1:7888/api/v1/run/228f99f9-fbc1-469d-bbd9-efd9bef15c29"
     headers = {"Content-Type": "application/json"}
     data = {"input_value": message}

     try:
         response = requests.post(url, headers=headers, json=data)
        response.raise_for_status()
        result = response.json()
        return extract_text(result)
    except requests.exceptions.RequestException as e:
        print(f"Request failed: {e}")
        return ""

def extract_text(response_json: dict) -> str:

    try:
        text = response_json["outputs"][0]["outputs"][0]["results"]["message"]["data"]["text"]
        return text
    except (KeyError, IndexError) as e:
        print(f"Error extracting text: {e}")
        return ""
