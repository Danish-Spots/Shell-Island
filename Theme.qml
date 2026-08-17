import QtQuick

QtObject {
    // Spacing
    readonly property int spacingXs: 4
    readonly property int spacingSm: 8
    readonly property int spacingMd: 16
    readonly property int spacingLg: 24
    readonly property int spacingXl: 32

    // Radius
    readonly property int radiusSm: 8
    readonly property int radiusMd: 12
    readonly property int radiusLg: 16
    readonly property int radiusXl: 24

// Surfaces
readonly property color background: "#242426"
readonly property color surface: "#303033"
readonly property color surfaceElevated: "#3b3b3f"
readonly property color surfaceHover: "#47474c"
readonly property color surfaceSelected: "#55555b"

// Text
readonly property color textPrimary: "#f5f5f7"
readonly property color textSecondary: "#c7c7cc"
readonly property color textMuted: "#9a9aa1"

// Accent
readonly property color accent: "#0a84ff"

// Borders
readonly property color borderSubtle: "#4a4a4f"
    
    // Typography
    readonly property int fontSm: 13
    readonly property int fontMd: 16
    readonly property int fontLg: 20

    // Motion
    readonly property int motionFast: 120
    readonly property int motionNormal: 180
    readonly property int motionSlow: 240
}