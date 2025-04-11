index = 0
step = os.getenv("MASSDRIVER_STEP_PATH") or "unknown"

function add_metadata(tag, timestamp, record)
    local seconds = math.floor(timestamp)
    local milliseconds = math.floor((timestamp - seconds) * 1000)
    local base_time = os.date("!%Y-%m-%dT%H:%M:%S", seconds)
    local ms_str = string.format("%03d", milliseconds)
    local iso8601 = base_time .. "." .. ms_str .. "Z"

    record["index"] = index
    record["step"] = step
    record["timestamp"] = iso8601

    index = index + 1
    return 1, timestamp, record
end