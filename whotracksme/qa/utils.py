import aiohttp
import asyncio
import async_timeout
import json


async def fetch(session, url):
    with async_timeout.timeout(10):
        try:
            async with session.head(url) as response:
                return {
                    "original_url": url,
                    "status": response.status,
                    "final_url": response.url
                }
        except:
            return {
                "original_url": url,
                "status": 499,  # assigned to exceptions
                "final_url": url
            }


async def fetch_all(session, urls, loop):
    results = await asyncio.gather(
        *[loop.create_task(fetch(session, url)) for url in urls]
    )
    return results


def retrieve_status(urls):
    async def main(urls, loop):
        conn = aiohttp.TCPConnector(verify_ssl=False)
        async with aiohttp.ClientSession(connector=conn) as session:
            return await fetch_all(session, urls, loop)

    loop = asyncio.get_event_loop()
    results = loop.run_until_complete(main(urls, loop))
    return results


def write_to_file(filepath, json_output):
    with open(f'{filepath}.json', 'w') as fout:
        json.dump(json_output, fout)
