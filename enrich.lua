index = 0
step = os.getenv("MASSDRIVER_STEP_PATH") or "unknown"

function add_index(tag, timestamp, record)
    local ts = math.floor(timestamp)
    local iso8601 = os.date("!%Y-%m-%dT%H:%M:%SZ", ts)

    record["index"] = index
    record["step"] = step
    record["date"] = iso8601

    index = index + 1
    return 1, timestamp, record
end
