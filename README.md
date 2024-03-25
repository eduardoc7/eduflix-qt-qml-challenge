<p align="center">
  <img 
    src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExMzd0N2pqaWdsa3FwNjBtNnppd3ZpeTc0dmpqc2Qxdnpnd21yMmZuNiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/dQFbeQl7LfhDTLLuHs/giphy.gif" 
    alt="Displaying the application through a running GIF"
    title="Displaying the application through a running GIF"
  /></a>
</p>

<h3 align="center">Eduflix Qt QML</h3>

<p align="center">
  <img alt="GitHub count language" src="https://img.shields.io/github/languages/count/eduardoc7/eduflix-qt-qml-challenge" />
  <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/eduardoc7/eduflix-qt-qml-challenge" />
  <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/eduardoc7/eduflix-qt-qml-challenge" />
  <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/eduardoc7/eduflix-qt-qml-challenge" />
</p>

## 📖 Presentation

EduFlix is a project developed solely for study purposes, aimed at exploring the latest techniques within the Qt Framework using QML in its most recent version. Initially conceived as a challenge presented during a technical job interview, this project serves as a practical exploration of modern Qt development methodologies and practices. Feel free to explore the codebase and experiment with the features implemented

---

## 🔎 Practical Concepts Covered
 - [X] Qt Framework Latest Version 6.5.3
 - [X] Qt Modules
 - [X] Qt Models
 - [X] Components Reusability
 - [X] Logic-Design Separation in QML using .ui.qml files
 - [X] Responsive Layouts using QtQuick.Layouts: Implements layouts that adapt to various screen sizes and orientations
 - [X] SOLID Concepts: Utilizing dependency inversion with the 'core' library, enabling the QML application to adapt to any data source. In case of API changes or the need to switch to a different API, the application remains flexible and extensible


---

## 🛠 Install and build

```bash
# Ensure you have the necessary dependencies installed:

# Qt Framework version 6.5.3
# Install Qt 6.5.3 from the official Qt website: https://www.qt.io/download

# Compiler (e.g., gcc)
# Install the appropriate compiler for your platform.

# CMake 3.16 minimum
# Install CMake 3.16 or later from: https://cmake.org/download

# Clone the repository:
git clone https://github.com/eduardoc7/eduflix-qt-qml-challenge.git

# Navigate to the project directory:
cd eduflix-qt-qml-challenge

# Build the project using CMake:
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=${INSTALLED_QT_FRAMEWORK_PATH}/6.5.3/gcc_64
cmake --build .
```

## ▶ Running
```bash
./bin/eduflix-qt-qml-challenge
```

---

## Disclaimer
This project is not intended for production use and should be treated as an educational resource only. Any feedback or contributions are welcome.

## Info to contact
- [LinkedIn](https://www.linkedin.com/in/eduardo-cordeiro-ba5278195/)
- eduardo.cordeiro1@outlook.com

## Credits 
This project utilizes data from the [TVmaze API](https://www.tvmaze.com/api), which is licensed under [CC BY-SA](http://creativecommons.org/licenses/by-sa/4.0/)

## License
Copyright © 2024 [Eduardo Cordeiro](https://github.com/eduardoc7).<br />
This project is [GNU 3.0](https://github.com/eduardoc7/eduflix-qt-qml-challenge/blob/master/LICENSE) licensed.