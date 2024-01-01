import { writable } from 'svelte/store';
import type { Privilege } from './models/auth';

export const userPrivileges = writable<Privilege>('guest');
export const isAnyDropdownOpen = writable(false);
export const language = writable('en');
