 Request

+--------------------------------------------------------------+
|FETCH_STATES|starttsWith key length|startsWith key            |
+--------------------------------------------------------------+

Response: In the respose the fetch_id MUST be encoded somehow. The daemon takes care that the fetch_id is unique per daemon. The fetch_id MUST be an integer number.

+-------------------------------------+
|marker for success|fetch_id          |
+-------------------------------------+
+-------------------------------------+
|marker for error                     |
+-------------------------------------+

 EVENTS:
+-------------------------------------------------------+
|event_type|fetch_id|Value type|Value length|Value      |
+-------------------------------------------------------+
