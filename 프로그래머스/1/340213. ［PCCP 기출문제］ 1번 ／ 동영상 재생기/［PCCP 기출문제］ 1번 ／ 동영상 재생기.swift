import Foundation

func solution(_ video_len: String, _ pos: String, _ op_start: String, _ op_end: String, _ commands: [String]) -> String {
    // 시간 정보를 초 단위로 변환
    func timeToSeconds(_ time: String) -> Int {
        let parts = time.components(separatedBy: ":").map { Int($0)! }
        return parts[0] * 60 + parts[1]
    }
    
    // 초 단위를 "mm:ss" 형식으로 변환
    func secondsToTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", minutes, secs)
    }
    
    // 입력값을 초 단위로 변환
    let videoLength = timeToSeconds(video_len)
    var currentPosition = timeToSeconds(pos)
    let openingStart = timeToSeconds(op_start)
    let openingEnd = timeToSeconds(op_end)
    
    // 오프닝 건너뛰기 함수
    func op_Skip() {
        if currentPosition >= openingStart && currentPosition <= openingEnd {
            currentPosition = openingEnd
        }
    }
    
    // 10초 후로 이동
    func addSecond() {
        currentPosition = min(currentPosition + 10, videoLength)
    }
    
    // 10초 전으로 이동
    func minusSecond() {
        currentPosition = max(currentPosition - 10, 0)
    }
    
    // 명령어 처리
    for command in commands {
        op_Skip() // 명령어 처리 전에 오프닝 건너뛰기
        if command == "next" {
            addSecond()
        } else if command == "prev" {
            minusSecond()
        }
        op_Skip() // 명령어 처리 후에 오프닝 건너뛰기
    }
    
    // 최종 위치를 "mm:ss" 형식으로 반환
    return secondsToTime(currentPosition)
}
