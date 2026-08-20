# 🚪 Automatic Door System using Verilog

## 📌 Project Description

This project implements an Automatic Door System using Verilog HDL.

The system uses a person detection sensor to automatically control
the door.

When a person is detected, the door opens.

When no person is detected, the door closes.

A simple Finite State Machine (FSM) is used to implement the system.

## ⚙️ Features

- Person detection
- Automatic door opening
- Automatic door closing
- FSM-based design
- Reset functionality
- Verilog testbench
- VCD waveform generation
- Icarus Verilog simulation
- GTKWave waveform analysis

## 🔌 Input

| Signal | Value | Meaning |
|---|---|---|
| person_detected | 0 | No person |
| person_detected | 1 | Person detected |

## 🚪 Output

| Signal | Value | Meaning |
|---|---|---|
| door_open | 0 | Door closed |
| door_open | 1 | Door open |

## 🔄 FSM States

### CLOSED

If a person is detected:

```text
CLOSED → OPEN
