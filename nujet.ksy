meta: 
  id: nujet
  endian: le

types:
  message:
    seq:
      - id: type
        type: u1
        enum: message_types
      - id: message
        type:
          switch-on: type
          cases:
            'message_types::request': request
            'message_types::response': response
            'message_types::event': event
            #'message_types::info': info
    enums:
      message_types:
        0: request
        1: response
        2: event
        3: info
  request:
    seq:
      - id: id
        type: u4
      - id: function_type
        type: u1
        enum: function_types
      - id: request_payload
        type:
          switch-on: function_type
          cases:
            'function_types::add_state' : add_state
#            'function_types::remove_state' : remove_state
            'function_types::set_state' : set_state
#            'function_types::notify_state' : notify_state
#            'function_types::add_method' : add_method
#            'function_types::remove_method' : remove_method
#            'function_types::call_method' : call_method
            'function_types::fetch' : fetch
    enums:
      function_types:
        0 : add_state
        1 : remove_state
        2 : set_state
        3 : notify_state
        4 : add_method
        5 : remove_method
        6 : call_method
        7 : fetch
## Request functions
  add_state:
    seq:
      - id: key
        type: key
      - id: value_type ##Mime type of the state value TODO: maybe this should be described differently
        type: value_type
  set_state:
    seq:
      - id: key
        type: key
      - id: value
        type: value
  fetch:
    seq:
      - id: starts_with_key
        type: key

## Request functions end
  response:
    seq:
      - id: id
        type: u4
       #Then some payload

## Response payloads
  fetch_response:
    seq:
      - id: status ## Marker for success or error
        type: u1
## 

  event:
    seq:
      - id: event_type
        type: u1
        enum: event_types
      - id: payload
        type:
          switch-on: event_type
          cases:
            'event_types::fetch': fetch_event
    enums:
      event_types:
        0: fetch
## Event Types
  fetch_event:
    seq:
      - id: id
        type: u4
      - id: type
        type: value_type
      - id: value
        type: value
# more event types to come later

##
  # TODO: what should the event type contain
  info:
    seq:
      - id: version
        type: u4

  key:
    seq:
      - id: key_length
        type: u4
      - id: key
        type: str
        size: key_length
        encoding: ASCII
  value:
    seq:
      - id: value_length
        type: u4
      - id: value
        size: value_length
  value_type:
    seq:
      - id: type
        type: u1
        enum: value_types
    enums:
      value_types:
        0: json

seq:
  - id: message
    type: message

