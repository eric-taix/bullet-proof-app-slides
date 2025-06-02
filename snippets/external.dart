Task<bool> getBool() => Task.of(true);

Task<int> getInt(bool even) => Task.of(1);

getBool().map(getInt);
