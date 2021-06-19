export class Words {
  count(source: string): Map<string, number> {
    return source
      .trim()
      .split(/\s+/)
      .reduce((dict, word) => {
        word = word.toLowerCase();
        dict.set(word, (dict.get(word) ?? 0) + 1);
        return dict;
      }, new Map<string, number>());
  }
}

export default Words;
