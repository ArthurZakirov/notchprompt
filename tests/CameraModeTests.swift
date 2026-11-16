import Foundation

@main
struct CameraModeTests {
    @MainActor static func main() {
        let model = PrompterModel.shared
        model.countdownSeconds = 0
        model.start()
        assert(model.isRunning)
        model.toggleCameraMode()
        assert(model.isCameraMode && model.isOverlayVisible && model.hasStartedSession)
        assert(!model.isRunning)
        model.handleManualScroll(deltaPoints: 28.8)
        assert(model.manualScrollDeltaPoints > 0 && !model.isRunning)
        model.handleManualScroll(deltaPoints: -28.8)
        assert(model.manualScrollDeltaPoints < 0)
        model.start()
        model.toggleCameraMode()
        assert(!model.isCameraMode && !model.isOverlayVisible && !model.isRunning)
        model.toggleCameraMode()
        assert(model.hasStartedSession && !model.isRunning)
        ScreenSelectionSelfTests.run()
        GlobalHotkeyManager.runSelfChecks()
        print("Camera lifecycle, scroll direction, screen selection and hotkey checks passed")
    }
}
