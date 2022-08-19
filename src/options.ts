import chalk from 'chalk';
import { Option } from 'commander';

const output = new Option('-o, --output <path>', `output path`);

const interfaceFile = new Option(
  '-I, --interface',
  chalk`{cyanBright.italic.bold interface} {white.dim declaration}`,
);
const serviceFile = new Option(
  '-S, --service',
  chalk`{cyanBright.italic.bold service} {white.dim declaration}`,
);
const controllerFile = new Option(
  '-C, --controller',
  chalk`{cyanBright.italic.bold controller} {white.dim declaration}`,
);
const moduleFile = new Option(
  '-M, --module',
  chalk`{cyanBright.italic.bold module} {white.dim declaration}`,
);
const decoratorFile = new Option(
  '-D, --decorator',
  chalk`{cyanBright.italic.bold decorator} {white.dim declaration}`,
);
const providerFile = new Option(
  '-P, --provider',
  chalk`{cyanBright.italic.bold provider} {white.dim declaration}`,
);

const testFile = new Option(
  '-T, --test',
  chalk`{cyanBright.italic.bold test} {white.dim declaration}`,
);

const force = new Option('-f, --force', 'overwrite existing file');
const dryRun = new Option('-d, --dry-run', 'only show what would be done');
const version = new Option('-V, --version', 'show version number');

export const options = {
  output,
  interfaceFile,
  serviceFile,
  controllerFile,
  moduleFile,
  decoratorFile,
  providerFile,
  testFile,
  force,
  dryRun,
  version,
};
