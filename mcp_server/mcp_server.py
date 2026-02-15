# TODO: Move to a separate folder

from fastmcp import FastMCP
from dotenv import load_dotenv
from tavily import TavilyClient
import os

load_dotenv()

mcp = FastMCP("Astralbound MCP server")
tavily_api_key = os.getenv("TAVILY_API_KEY")
tavily_client = TavilyClient(api_key=tavily_api_key)


@mcp.tool
def web_search(query: str, max_results: int = 5) -> dict:
    response = tavily_client.search(
        query=query,
        search_depth="basic",
        max_results=max_results,
    )

    return response


if __name__ == "__main__":
    mcp.run(transport="http", host="127.0.0.1", port=8080)
