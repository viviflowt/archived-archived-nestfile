import chalk from 'chalk';
import { Command } from 'commander';
import { log } from 'console';
import f from 'lodash/fp';
import fs from 'fs';
import path from 'path';

export const debug = (program: Command) => {
  console.log('args:', chalk.gray(program.args.join(' ')));
  console.log(
    'opts:',
    chalk.gray(JSON.stringify(program.optsWithGlobals(), null, 2)),
  );
};
