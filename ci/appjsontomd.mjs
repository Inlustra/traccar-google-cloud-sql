import tablemark from "tablemark";
import fs from "fs";
import appjson from "../app.json";
import Handlebars from "handlebars";

const envVars = Object.entries(appjson.env).reduce((prev, [key, value]) => {
  return [...prev, { name: key, ...value }];
}, []);

const envVarsMarkdown = tablemark(envVars);
const handlebarsReadme = fs
  .readFileSync("./README.handlebars.md")
  .toString("utf-8");
const readmeTemplate = Handlebars.compile(handlebarsReadme);

fs.writeFileSync("../README.md", readmeTemplate({ envVars: envVarsMarkdown }));
