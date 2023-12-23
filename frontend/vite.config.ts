import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vitest/config';

export default defineConfig({
	plugins: [sveltekit()],
	test: {
		include: ['src/**/*.{test,spec}.{js,ts}']
	},
	server: {
		watch: {
			usePolling: true,
			interval: 1000,
			ignored: ['**/node_modules/**', '**/dist/**', '**/build/**', '**/.git/**']
		}
	}
});
