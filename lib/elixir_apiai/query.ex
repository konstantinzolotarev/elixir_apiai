defmodule ElixirApiai.Query do
  @moduledoc """
  Query API wrapper [Api.ai Query](https://api.ai/docs/reference/agent/query)
  """
  import ElixirApiai.Utils.Api

  @doc """
  Makes a `query` request to Api.ai

  This method uses `POST /query` API method with JSON payload.

  All parameters except `query` and `sessionId` could be passed as `options`.
  Usage:
  ```elixir
  iex(1)> ElixirApiai.Query.query("Hey", "randomSessionId")
  {:ok,
    %{id: "c728eb69-f5f5-41a9-b9fa-8760786f547d",
    lang: "en",
    result: %{action: "smalltalk.greetings.hello", actionIncomplete: false,
     contexts: [],
     fulfillment: %{messages: [%{speech: "Howdy.", type: 0}],
       speech: "Good day!"}, metadata: %{}, parameters: %{},
     resolvedQuery: "Hello", score: 1.0, source: "domains"},
    sessionId: "random-session-id",
    status: %{code: 200, errorType: "success"},
    timestamp: "2017-08-17T14:36:28.608Z"}
  }
  ```

  And with additional options:
  ```elixir
  iex(5)> ElixirApiai.Query.query("What is the weather ?", "random-session-id", %{location: %{latitude: 37.459157, longitude: -122.17926}})
  {:ok,
   %{id: "75648817-9f27-4eed-982f-ccfa5b93bcc4", lang: "en",
     result: %{action: "weather", actionIncomplete: false, contexts: [],
       fulfillment: %{messages: [%{speech: "Let me check ....", type: 0}],
         speech: "Let me check ...."},
       metadata: %{intentId: "7382c6b7-cd72-4113-adcd-aac3efa49f37",
         intentName: "What is the weather ?", webhookForSlotFillingUsed: "false",
         webhookUsed: "false"}, parameters: %{},
       resolvedQuery: "What is the weather ?", score: 1.0, source: "agent"},
     sessionId: "random-session-id", status: %{code: 200, errorType: "success"},
     timestamp: "2017-08-17T14:40:05.186Z"}}
  ```
  """
  @spec query(String.t, String.t, map) :: {:ok, map} | {:error, any}
  def query(query, session_id, options \\ %{}) do
    body = %{
      query: query,
      sessionId: session_id
    }

    post("query", [body: Map.merge(body, options)])
  end
end
