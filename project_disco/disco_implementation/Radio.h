
#ifndef RADIO_H
#define RADIO_H

enum {
 AM_DISCORADIO = 6
};

typedef nx_struct radio_discovery_msg {
  nx_uint16_t MSG; // Message type header.
  nx_uint16_t ID;  // Local node ID.
} radio_discovery_msg;

typedef nx_struct radio_discovered_msg {
  nx_uint16_t MSG; // Message type header.
  nx_uint16_t ID; // Local node ID.
  nx_uint16_t FOUND; // Found mote ID.
} radio_discovered_msg;

typedef nx_struct radio_online_msg {
  nx_uint16_t MSG; // Message type header.
  nx_uint16_t ID; // Local node ID.
} radio_online_msg;

#define DISCO_MSG  1
#define FOUND_MSG  2
#define ONLINE_MSG 3

#endif
