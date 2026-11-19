# 🌱 Smart Irrigation Decision System

A rule-based Artificial Intelligence expert system developed using **Prolog** that helps determine irrigation requirements based on crop type, soil moisture, temperature, humidity, and expected rainfall.

## 📌 Project Overview

The Smart Irrigation Decision System analyses agricultural and environmental conditions provided by the user and generates an appropriate irrigation recommendation.

The system uses predefined facts and logical rules to determine whether irrigation is required, whether it should be postponed, or whether it is not required.

This project demonstrates the application of **Logic Programming and Rule-Based Expert Systems in Artificial Intelligence**.

## 🎯 Problem Statement

Farmers need to decide when and how much water should be supplied to their crops.

Unnecessary irrigation can waste water, while insufficient irrigation can affect crop growth.

This project provides a simple rule-based solution that analyses different environmental conditions and generates irrigation recommendations.

## ✨ Features

- User-based input system.
- Supports two crops: Tomato and Wheat.
- Crop-specific soil moisture requirements.
- Soil condition detection (Dry / Adequate).
- Temperature classification (High / Moderate).
- Humidity classification (Low / Normal).
- Rainfall condition checking.
- Five decision-making rules.
- Input validation for crop names and numerical values.
- Automatic irrigation recommendations.
- Displays the reason behind each recommendation.

## 🛠️ Technologies Used

- **Programming Language:** Prolog
- **Prolog Environment:** SWI-Prolog
- **Code Editor:** Visual Studio Code
- **Library:** SWI-Prolog `readutil`

## 🌾 Supported Crops

| Crop | Minimum Soil Moisture Requirement |
|---|---:|
| Tomato | 40% |
| Wheat | 30% |

*These are predefined demonstration thresholds used in this project.*

## 📥 Input Parameters

The program asks the user to enter five parameters:

| Parameter | Description | Accepted Values |
|---|---|---|
| Crop Type | Selected crop | tomato / wheat |
| Soil Moisture | Current soil moisture | 0–100% |
| Temperature | Current temperature | 0–60°C |
| Humidity | Current humidity | 0–100% |
| Expected Rainfall | Whether rainfall is expected | yes / no |

## 🧠 Decision-Making Rules

The system uses five logical rules:

| Rule | Condition | Recommendation |
|---|---|---|
| Rule 1 | Rainfall expected and soil moisture insufficient | Postpone irrigation |
| Rule 2 | Soil moisture is sufficient | No irrigation |
| Rule 3 | Very low moisture (≤15%) or hot and dry weather | High irrigation |
| Rule 4 | Insufficient moisture up to 25% | Medium irrigation |
| Rule 5 | Remaining insufficient moisture conditions | Low irrigation |

**Note:** Rules are evaluated in order. The first successfully matched rule determines the recommendation.

### 6. Enter Your Inputs

The program will ask for:

1. Crop name
2. Soil moisture
3. Temperature
4. Humidity
5. Expected rainfall (yes/no)

After receiving all inputs, the system automatically displays the irrigation recommendation.

## 💻 Sample Execution

**Example Input:**

```text
Crop Name: tomato
Soil Moisture: 20
Temperature: 38
Humidity: 30
Rainfall Expected: no
```

**Expected Output:**

```text
====================================
       SMART IRRIGATION SYSTEM
====================================

Crop: tomato
Soil Moisture: 20%
Soil Condition: dry
Temperature: 38 C
Temperature Condition: high
Humidity: 30%
Humidity Condition: low
Rainfall Expected: no

Recommendation: required
Suggested Level: high

Reason: Very low moisture or hot and dry weather
====================================
```

## 🎥 Project Demonstration Video

Watch the complete project demonstration, including source code explanation, user input and program execution:

**[▶ Watch Smart Irrigation System Demonstration]

