def string_splosion(str):
    new=""
    for i in range(len(str)+1):
        new+=str[:i]
    return new
