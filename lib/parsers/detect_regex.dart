Map regexes = {
  "kodik":
      r"(https:\/\/|\/\/)(www\.)?\w{5,32}\.\w{2,6}\/(?:seria|video|film)\/\d+\/\w+\/\d{3,4}p", // Note: season/serial will not be recognized
  "csst": r"https?:\/\/(www\.)?csst\.online\/embed\/\d+",
  "sibnet": r"https?:\/\/(www\.)?video\.sibnet",
  "sovetromantica": r"https?:\/\/(www\.)?sovetromantica\.com\/embed\/(.+)",
  "aniboom": r"https://(www.)?aniboom\.one/"
};
