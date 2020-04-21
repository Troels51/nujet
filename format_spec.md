# Notes from  meeting about format

## Request/Response/Event
  
  Jet key/value store:
  - key: string
  - value: byte array






   jet functions

   - add state
   | remove state
   | set state                              +-----------------------------------------------------+
   | notify state (emitted only by owner)   |Message type        |Message body                    |
   | call method                            +-----------------------------------------------------+
   | add method                                                  +--------------------------------|
   | remove method                               Request         |id |Request payload            ||
   - fetch                                                       +--------------------------------|
                                                                     +----------------------------+
                                                                     |jet f. |jet function payload|
                                                                     +----------------------------+
                                                                 +--------------------------------+
                                                  Response       |id  |Response payload           |
                                                                 +--------------------------------+
                      Message types:
                      - request
                      | response
                      | event (request which does not get a response)
                      - info (to get protocol version etc., always sent out immediately by the daeomon after a peer connects)





add state request payload

+--------------------------------------------------------------------------+
|ADD_STATE|key length|key|Value type|Value length|Value                    |         Value type: an enumeration describing the mime type of the value
+--------------------------------------------------------------------------+

+--------------------------------------------------------------------------+
|SET_STATE|key length|key|Value type|Value length|Value                    |
+--------------------------------------------------------------------------+


### Fetching Events


Request:

+-------------------------------------------------------------+
|FETCH_STATES|startsWith key length|startsWith key            |
+-------------------------------------------------------------+

Response: In the respose the fetch_id MUST be encoded somehow. The daemon takes care that the fetch_id is unique per daemon. The fetch_id MUST be an integer number.

+-------------------------------------+
|marker for success|fetch_id          |
+-------------------------------------+
+-------------------------------------+
|marker for error                     |
+-------------------------------------+

Events: Happens if a matching key is added/changed/removed

+----------------------------------------------------------------------+
|event_type|fetch_id|key length|key|Value type|Value length|Value      |
+----------------------------------------------------------------------+

  Event types:
  - add
  - change
  - remove
