import 'jest-ts-auto-mock';
import 'jest-extended';
import 'reflect-metadata';

export default {
  preset: 'ts-jest',
  testMatch: ['**/*.test.[jt]s?(x)', '**/*.spec.[jt]s?(x)'],
  testEnvironment: 'node',
  collectCoverage: false,
  verbose: true,
  coverageDirectory: 'coverage',
  collectCoverageFrom: [
    'src/**/*.(t|j)s',
    '!**/*.spec.ts',
    '!**/*.test.ts',
    '!**/node_modules/**',
    '!**/__tests__/**',
    '!**/__mocks__/**',
    '!**/index.(t|j)s',
    '!**/main.(t|j)s',
    '!**/types.ts',
  ],
  testTimeout: 4 * 60 * 1000, // 4 minutes
  setupFilesAfterEnv: ['jest-extended/all'],
  roots: ['<rootDir>/src/'],
  moduleNameMapper: {
    '^@nestjsrad/typegoose(|/.*)$': '<rootDir>/$1',
  },
};
