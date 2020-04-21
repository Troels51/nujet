from nujet import *
import asyncio
import websockets

async def handle_request(message: Nujet):
    print("Got request")
    pass

handlers = {
    Nujet.Message.MessageTypes.request: handle_request
}

async def consume(message):
    print(message)
    package = Nujet.from_bytes(message)
    if(package.message.type in handlers):
        await handlers[package.message.type](package)
    else:
        print("could not process type")


async def consumer_handler(websocket, path):
    async for message in websocket:
        await consume(message)

def main():
    start_server = websockets.serve(consumer_handler, "localhost", 8765)

    asyncio.get_event_loop().run_until_complete(start_server)
    asyncio.get_event_loop().run_forever()



if __name__ == '__main__':
    main()