var WebToolPlugins = {
    _SetInfoPanelVisible: function(visible) {
        if(typeof setInfoPanelVisible !== 'undefined') {
            setInfoPanelVisible(visible);
        }
    },

    _AddTimeTrackingEvent: function(eventName) {
        if(typeof godotTimeTrackers == 'undefined') {
            godotTimeTrackers = new Map();
        }

        const currentTime = performance.now();
        godotTimeTrackers.set(eventName, currentTime);

        if(typeof onAddTimeTracker !== 'undefined') {
            onAddTimeTracker(eventName);
        }

        var currentTimeRounded = currentTime.toFixed(2);
        console.log('Time tracker event ' + eventName + ': ' + currentTimeRounded + 'ms');
    },

    _AddFpsTrackingEvent: function(fps) {
        if(typeof onFpsTrackingEvent !== 'undefined') {
            onFpsTrackingEvent(fps);
        }
    }
};

// Make these functions available to Godot
if (typeof window !== 'undefined') {
    window.WebToolPlugins = WebToolPlugins;
}
