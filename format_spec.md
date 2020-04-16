  ## Notes from  meeting about format

  
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
                      | event
                      | (request which does not get a response)
                      - info (to get protocol version etc., always sent out immediately by the daeomon after a peer connects)





add state request payload

+--------------------------------------------------------------------------+
|ADD_STATE|key length|key|Value type|Value length|Value                    |         Value type: an enumeration describing the mime type of the value
+--------------------------------------------------------------------------+

+--------------------------------------------------------------------------+
|SET_STATE|key length|key|Value type|Value length|Value                    |
+--------------------------------------------------------------------------+
