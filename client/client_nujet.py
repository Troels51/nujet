from nujet import Nujet
import asyncio
import websockets
import array

request_array = []
async def hello():
    uri = "ws://localhost:8765"
    async with websockets.connect(uri) as websocket:
        while True:
            message_type = input("What to send")
            message_type = "request"
            message = bytes()
            if (message_type == "request"):
                message = bytes(
                    [Nujet.Message.MessageTypes.request.value,
                     0,0,0,0, #id
                     Nujet.Request.FunctionTypes.add_state.value,
                     ])
                add_state_payload = bytes()

                key = "something"
                value_type = "int"
                value = "42"
                add_state_payload += bytes((len(key)))
                add_state_payload += bytes((key.encode('ascii')))
                add_state_payload += bytes((len(value_type)))
                add_state_payload += bytes((value_type.encode('ascii')))
                add_state_payload += bytes((len(value)))
                add_state_payload += bytes((value.encode('ascii')))
                message += (add_state_payload)
            await websocket.send(message)


def main():
    asyncio.get_event_loop().run_until_complete(hello())


if __name__ == '__main__':
    main()