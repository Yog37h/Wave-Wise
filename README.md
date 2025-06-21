# 🚢 IoT-Based Maritime Safety System

> Enhancing safety, efficiency, and profitability for fishermen using real-time IoT data, predictive analytics, and mobile technology.

![Tech](https://img.shields.io/badge/Built%20With-Flutter%20%7C%20Node.js%20%7C%20ESP32%20%7C%20Raspberry%20Pi-blue)
![DB](https://img.shields.io/badge/Database-PostgreSQL-green)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

---

## 📖 Overview

This project is a smart, IoT-powered system that leverages **GPS**, **environmental sensors**, **machine learning**, and **mobile technology** to transform traditional fishing into a safer, more data-driven, and profitable experience for fishermen.

### Key Capabilities:
- 🚨 Real-time weather and engine health alerts  
- 🧭 GPS-based boat tracking and zone detection  
- 🧠 ML-driven catch success and fish price predictions  
- 📱 Intuitive mobile interface (built with Flutter)  
- ☁️ Cloud communication using ESP32 & Raspberry Pi  
- 🌊 Market & hub data sharing via Meta’s social graph

---

## 🚀 Features

- 🌡️ **Weather Safety Prediction** – Temp/humidity sensors + ML models for real-time fishing safety
- 📍 **Live GPS Tracking** – Real-time latitude/longitude from GPS module and ESP32
- 🛠️ **Engine Health Monitoring** – Smoke detection via MQ3 sensor to prevent breakdowns
- 🧠 **Catch & Market Prediction** – ML models forecast catch potential and fish prices
- 🛒 **Market & Hub Finder** – View less-crowded hubs, market availability, and direct sale areas
- 🔐 **Authentication** – Secure login using Firebase
- ☁️ **ThingSpeak Cloud** – For live IoT data streaming from hardware
- 📡 **ESP32 + Raspberry Pi** – Efficient, wide-range sensor integration and ML model execution
- 🗺️ **Ultrasonic Zone Monitoring** – Tracks boat entries/exits in fishing zones

---

## 🛠️ Tech Stack

| Component           | Technology                             |
|---------------------|----------------------------------------|
| **Mobile App**      | Flutter                                |
| **Backend APIs**    | Node.js, Express                       |
| **Database**        | PostgreSQL                             |
| **IoT Hardware**    | ESP32, DHT11, MQ3, GPS, Ultrasonic     |
| **ML Models**       | Python (XGBoost, RF, Decision Trees)   |
| **Cloud & Comm.**   | ThingSpeak, Firebase, ngrok            |
| **Processing Unit** | Raspberry Pi (local ML model compute)  |

---

## 📱 App Screens Overview

- 🧭 **Find Boat**: Real-time boat tracking  
- 🌦️ **Weather Report**: Sensor-based safety alerting  
- 📊 **Market Insights**: Fish price predictions & demand forecast  
- 🧾 **Fishing Dashboard**: Boat traffic, alerts, weather & catch data  
- 🌍 **Hubs Availability**: Crowd insights and alternate routes  
- 📇 **Contacts**: Network with suppliers & buyers

---

## 📦 Installation & Setup

### Prerequisites

- Flutter SDK & Dart
- Node.js + npm
- PostgreSQL
- ESP32 + Raspberry Pi setup
- Firebase project

### 1. Clone the Repo

```bash
git clone https://github.com/your-username/eiot-maritime-safety.git
cd eiot-maritime-safety
