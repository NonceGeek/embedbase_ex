defmodule EmbedbaseInteractorEx do
  @moduledoc """
      It's easy to get a prototype up-and-running. But, that's not where it stops. How do you persist data? Which LLM should you use? How can you keep up with the ever advancing pace of AI?

      Embedbase provides you with all the tools you need to create native production-ready applications powered by LLMs.

      > https://embedbase.xyz/
  """

  # use Application

  @api_url "https://api.embedbase.xyz"
  @default_retries 5

  require Logger
  mix docs
  defp api_key() do
    value = System.fetch_env("api_key")
    value
  end

  def insert_data(dataset_id, data) when is_list(data) do
      url = "#{@api_url}/v1/#{dataset_id}"
      Enum.map(data, fn %{content: content, tag: tag} ->
          body = %{documents: [%{data: content}]}
          {:ok, %{id: id}} =ExHttp.http_post(url, body, api_key(), @default_retries)
          {tag, id}
      end)

  end

  def insert_data(dataset_id, data) do
      url = "#{@api_url}/v1/#{dataset_id}"
      body = %{documents: [%{data: data}]}
      ExHttp.http_post(url, body, api_key(), @default_retries)
  end

  def insert_data(dataset_id, data, metadata) do
      url = "#{@api_url}/v1/#{dataset_id}"
      body = %{documents: [%{data: data, metadata: metadata}]}
      ExHttp.http_post(url, body, api_key(), @default_retries)
  end

  def search_data(question, :bing) do
      url = "#{@api_url}/v1/internet-search"
      body = %{query: question, engine: "bing"}
      ExHttp.http_post(url, body, api_key(), @default_retries)
  end

  def search_data(dataset_id, question) do
      url = "#{@api_url}/v1/#{dataset_id}/search"
      body = %{query: question}
      ExHttp.http_post(url, body, api_key(), @default_retries)
  end

  def delete_dataset(dataset_id) do
      url = "#{@api_url}/v1/#{dataset_id}/clear"
      ExHttp.http_get(url, api_key(), @default_retries)
  end

  #     Retrieving Data
  # Using Bing Search
  # Inserting Data
  # Updating Data
  # Delete data
  # Delete dataset

end
