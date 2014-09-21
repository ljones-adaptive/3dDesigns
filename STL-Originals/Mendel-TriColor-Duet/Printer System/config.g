; Configuration file for RepRap Ormerod
; RepRapPro Ltd
;
M111 S0                                          ; Debug on
M550 PTricolour Mendel
M551 Pgdww1620
M540 P0xBE:0xEF:0xDE:0xAD:0xFE:0xED              ; Set the MAC address
M552 P192.168.1.55
M553 P255.255.255.0
M554 P192.168.1.254
M555 P2                                          ; Set output to look like Marlin
G21                                              ; Work in mm
G90                                              ; Absolute positioning
M83                                              ; Extrusions relative
M906 X900 Y900 Z900 E800                         ; Motor currents (mA)
T0
M563 P1 D4                                       ; Create tool 1 (Dumme)
M563 P2 D0 H1                                    ; Create tool 2
M563 P3 D1 H1                                    ; Create tool 3
M563 P4 D2 H1                                    ; Create tool 4
M563 P5 D3 H1                                    ; Create tool 5
G10 P1 S0 R0                                     ; Set tool 1 operating and standby temperatures
G10 P2 S0 R0                                     ; Set tool 2 operating and standby temperatures
G10 P3 S0 R0                                     ; Set tool 3 operating and standby temperatures
G10 P4 S0 R0                                     ; Set tool 4 operating and standby temperatures
G10 P5 S0 R0                                     ; Set tool 5 operating and standby temperatures
M92 X100.25 Y100.25 Z4001.50 E420.00             ; Set axis steps per unit
M208 X200 Y200 Z100                              ; set axis max travel
;
M201 X800 Y800 Z15 E1000                         ; acceleration tweaks for improved finish
M203 X15000 Y15000 Z200 E3600                    ; speed tweaks for improved finish
M210 X1200 Y1200 Z200                            ; Set Homing Speed
T1
;
M558 P0                                          ; Set Z Probe to SW
G31 Z0.0 P0                                      ; Set Z probe height at witch the SW Trigers
;
; Set Axis compensation
;
G30 P0 X25.0 Y25.0 Z-0.05
G30 P1 X25.0 Y175.0 Z-0.25
G30 P2 X175.0 Y175.0 Z0.0
G30 P3 X175.0 Y25.0 Z-0.35 S                     ; X175.0 Y25.0 Z-0.3 
M556 S78 X0.0 Y0.40 Z0.35                        ; Set Axis compensation
