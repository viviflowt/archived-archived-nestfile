#!/usr/bin/env node

import chalk from 'chalk';
import { Command } from 'commander';
import { log } from 'console';
import fs from 'fs';
import inquirer from 'inquirer';
import f from 'lodash/fp';
import path from 'path';
import { options } from './options';

const program = new Command();

program
  .name('makefile')
  .version('0.0.2', '--version', 'output the version')
  .description('File generator for NestJs projects.')
  .showSuggestionAfterError(true)
  .configureHelp({
    sortOptions: false,
    sortSubcommands: false,
    subcommandDescription(subcommand) {
      return subcommand.description();
    },
    optionTerm(option) {
      return option.flags;
    },
  })
  .argument('<name>', 'name of the file')
  .addOption(options.output)
  .addOption(options.interfaceFile)
  .addOption(options.moduleFile)
  .addOption(options.serviceFile)
  .addOption(options.controllerFile)
  .addOption(options.providerFile)
  .addOption(options.decoratorFile)
  .addOption(options.testFile)
  .addOption(options.force)
  .addOption(options.dryRun)
  .addOption(options.version)
  .addHelpText('afterAll', ' ')
  .action(async () => {
    const setup = {
      dryRun: false,
      force: false,
      output: path.join(process.cwd(), 'src'),
      ...program.optsWithGlobals(),
    };

    let name =
      program.args.join(' ') ||
      (await inquirer
        .prompt({
          type: 'input',
          name: 'name',
          message: 'What is the name of the file?',
        })
        .then(f.get('name')));

    if (!name) {
      log(chalk.red('No name provided'));
      process.exit(1);
    }

    name = f.kebabCase(
      f.pipe(f.split(' '), f.map(f.trim), f.compact, f.join(' '))(name),
    );

    const fileTypes = {
      interface: '.interface.ts',
      service: '.service.ts',
      controller: '.controller.ts',
      module: '.module.ts',
      decorator: '.decorator.ts',
      provider: '.provider.ts',
      test: '.spec.ts',
    };

    const ext =
      f.pipe(
        f.pick([...f.keys(fileTypes), 'fileType']),
        f.keys,
        f.map((key) => fileTypes[key]),
        f.first,
      )(setup) || '.ts';

    const output = f.get('output')(setup);

    const filePath = path.join(output, name + ext);

    const relativePath = path.relative(process.cwd(), filePath);

    if (fs.existsSync(filePath) && !setup.force && !setup.dryRun) {
      log(chalk.red('File already exists'));
      process.exit(1);
    }

    if (setup?.dryRun === true) {
      chalk.gray(`Would create file ${filePath}`);
      log(chalk.italic(relativePath), chalk.green('created'));
      process.exit(0);
    }

    await fs.promises
      .writeFile(filePath, '')
      .then(() => {
        log(chalk.italic(relativePath), chalk.greenBright('created'));
      })
      .catch(() => {
        log(chalk.red('File could not be created'));
        process.exit(1);
      });
  });

program.parse(process.argv);
