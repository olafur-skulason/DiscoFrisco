
#ifndef RADIO_H
#define RADIO_H

typedef nx_struct radio_discovery_msg {
  nx_uint16_t MSG; // Message type header.
  nx_uint16_t ID;  // Local node ID.
} radio_discovery_msg;

#define DISCO_MSG 1

#endif
