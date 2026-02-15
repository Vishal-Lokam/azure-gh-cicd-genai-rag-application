import asyncio
import logfire
import os
from dotenv import load_dotenv
from pydantic_ai import Agent
from pydantic_ai.models.openai import OpenAIChatModel
from pydantic_ai.providers.openai import OpenAIProvider
from pydantic_ai.mcp import MCPServerStreamableHTTP
from openai import AsyncAzureOpenAI

load_dotenv()


logfire.configure()
logfire.instrument_pydantic_ai()

server = MCPServerStreamableHTTP("http://localhost:8080/mcp")

# TODO: Pull credentials directly from the Azure key vault
client = AsyncAzureOpenAI(
    azure_endpoint=os.getenv("ENDPOINT_URL"),
    api_version=os.getenv("AZURE_OPENAI_API_VERSION"),
    api_key=os.getenv("AZURE_OPENAI_API_KEY"),
)

model = OpenAIChatModel(
    "gpt-4.1-nano",
    provider=OpenAIProvider(openai_client=client),
)

agent = Agent(model=model, toolsets=[server])


async def main():
    result = await agent.run("What is the latest Winter olympics 2026 news?")
    print(result.output)


if __name__ == "__main__":
    asyncio.run(main())
